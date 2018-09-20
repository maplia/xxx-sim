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

  test 'deleted?' do
    Music.pivot = nil
    assert_not musics(:cxb_wannabe).deleted?
    assert musics(:cxb_hagitoko).deleted?

    Music.pivot = Time.parse('2016-06-20')
    assert_not musics(:cxb_wannabe).deleted?
    assert_not musics(:cxb_hagitoko).deleted?

    Music.pivot = Time.parse('2016-06-21')
    assert_not musics(:cxb_hagitoko).deleted?

    Music.pivot = Time.parse('2016-06-22')
    assert musics(:cxb_hagitoko).deleted?
  end

  test 'find_actives' do
    Music.pivot = nil
    music_ids = Music.find_actives.pluck(:text_id)
    assert music_ids.include?(musics(:cxb_wannabe).text_id)
    assert music_ids.include?(musics(:cxb_aeug).text_id)
    assert music_ids.include?(musics(:cxb_hagitoko).text_id)
    assert_not music_ids.include?(musics(:cxb_spica).text_id)

    Music.pivot = Date.parse('2013-12-01')
    music_ids = Music.find_actives.pluck(:text_id)
    assert_not music_ids.include?(musics(:cxb_wannabe).text_id)

    Music.pivot = Date.parse('2013-12-02')
    music_ids = Music.find_actives.pluck(:text_id)
    assert music_ids.include?(musics(:cxb_wannabe).text_id)

    Music.pivot = Date.parse('2013-12-03')
    music_ids = Music.find_actives.pluck(:text_id)
    assert music_ids.include?(musics(:cxb_wannabe).text_id)

    Music.pivot = Date.parse('2014-01-15')
    music_ids = Music.find_actives.pluck(:text_id)
    assert_not music_ids.include?(musics(:cxb_aeug).text_id)

    Music.pivot = Date.parse('2014-01-16')
    music_ids = Music.find_actives.pluck(:text_id)
    assert music_ids.include?(musics(:cxb_aeug).text_id)

    Music.pivot = Date.parse('2014-01-17')
    music_ids = Music.find_actives.pluck(:text_id)
    assert music_ids.include?(musics(:cxb_aeug).text_id)
  end
end
