require 'test_helper'

class MusicTest < ActiveSupport::TestCase
  test 'level' do
    assert_same musics(:cxb_wannabe).level(MUSIC_DIFF_ESY), musics(:cxb_wannabe).level1
    assert_same musics(:cxb_wannabe).level(MUSIC_DIFF_STD), musics(:cxb_wannabe).level2
    assert_same musics(:cxb_wannabe).level(MUSIC_DIFF_HRD), musics(:cxb_wannabe).level3
    assert_same musics(:cxb_wannabe).level(MUSIC_DIFF_MAS), musics(:cxb_wannabe).level4
    assert_same musics(:cxb_wannabe).level(MUSIC_DIFF_UNL), musics(:cxb_wannabe).level5
    assert_nil musics(:cxb_wannabe).level(128)
  end

  test 'notes' do
    assert_same musics(:cxb_wannabe).notes(MUSIC_DIFF_ESY), musics(:cxb_wannabe).notes1
    assert_same musics(:cxb_wannabe).notes(MUSIC_DIFF_STD), musics(:cxb_wannabe).notes2
    assert_same musics(:cxb_wannabe).notes(MUSIC_DIFF_HRD), musics(:cxb_wannabe).notes3
    assert_same musics(:cxb_wannabe).notes(MUSIC_DIFF_MAS), musics(:cxb_wannabe).notes4
    assert_same musics(:cxb_wannabe).notes(MUSIC_DIFF_UNL), musics(:cxb_wannabe).notes5
    assert_nil musics(:cxb_wannabe).notes(128)
  end

  test 'monthly?' do
    Music.pivot = nil
    assert_not Music.where(text_id: musics(:cxb_aeug).text_id).first.monthly?

    Music.pivot = Time.parse('2018-06-01 03:59:59')
    assert_not Music.where(text_id: musics(:cxb_wannabe).text_id).first.monthly?

    Music.pivot = Time.parse('2018-06-01 04:00:00')
    assert Music.where(text_id: musics(:cxb_wannabe).text_id).first.monthly?

    Music.pivot = Time.parse('2018-06-01 04:00:01')
    assert Music.where(text_id: musics(:cxb_wannabe).text_id).first.monthly?
  end

  test "find_actives" do
    musics = Music.find_actives
    music_ids = musics.pluck(:text_id)
    assert music_ids.include?(musics(:cxb_wannabe).text_id)
    assert music_ids.include?(musics(:cxb_aeug).text_id)
    assert_not music_ids.include?(musics(:cxb_hagitoko).text_id)
    assert_not music_ids.include?(musics(:cxb_spica).text_id)

    musics = Music.find_actives('20131201')
    music_ids = musics.pluck(:text_id)
    assert_not music_ids.include?(musics(:cxb_wannabe).text_id)

    musics = Music.find_actives('20131202')
    music_ids = musics.pluck(:text_id)
    assert music_ids.include?(musics(:cxb_wannabe).text_id)

    musics = Music.find_actives('20131203')
    music_ids = musics.pluck(:text_id)
    assert music_ids.include?(musics(:cxb_wannabe).text_id)

    musics = Music.find_actives('20140115')
    music_ids = musics.pluck(:text_id)
    assert_not music_ids.include?(musics(:cxb_aeug).text_id)

    musics = Music.find_actives('20140116')
    music_ids = musics.pluck(:text_id)
    assert music_ids.include?(musics(:cxb_aeug).text_id)

    musics = Music.find_actives('20140117')
    music_ids = musics.pluck(:text_id)
    assert music_ids.include?(musics(:cxb_aeug).text_id)

    musics = Music.find_actives('20160620')
    music_ids = musics.pluck(:text_id)
    assert music_ids.include?(musics(:cxb_hagitoko).text_id)

    musics = Music.find_actives('20160621')
    music_ids = musics.pluck(:text_id)
    assert music_ids.include?(musics(:cxb_hagitoko).text_id)

    musics = Music.find_actives('20160622')
    music_ids = musics.pluck(:text_id)
    assert_not music_ids.include?(musics(:cxb_hagitoko).text_id)
  end
end
