require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  test 'maximize!' do
    Skill.mode = :cxb
    skill = Skill.new(user: User.new, music: musics(:cxb_wannabe))
    skill.maximize!
    max_diff = musics(:cxb_wannabe).max_diff
    bonus_rate = SKILL_GAUGE_BONUS_RATES[SKILL_GAUGE_ULTIMATE]
    MUSIC_DIFFS_ALL.keys.each do |diff|
      if diff == max_diff
        assert_equal 100.0, skill.rate(diff)
        assert_equal SKILL_STAT_CLEARED, skill.stat(diff)
        assert_equal SKILL_GAUGE_ULTIMATE, skill.gauge(diff)
        assert_equal SKILL_COMBO_EXC, skill.combo(diff)
        assert_equal musics(:cxb_wannabe).level(diff) * bonus_rate, skill.point(diff)
      else
        assert_nil skill.rate(diff)
        assert_nil skill.stat(diff)
        assert_nil skill.gauge(diff)
        assert_nil skill.combo(diff)
        assert_nil skill.point(diff)
      end
    end
    assert_equal musics(:cxb_wannabe).level(max_diff) * bonus_rate, skill.best_point
    assert_equal max_diff, skill.best_diff
    assert_equal musics(:cxb_wannabe).level(max_diff) * bonus_rate, skill.l_best_point
    assert_equal max_diff, skill.l_best_diff
    assert_nil skill.comment
  end

  test 'stat' do
    Skill.mode = :cxb
    [:skill_cxb_fixed].each do |target|
      assert_same_each_music_diff skills(target), 'stat'
      assert_nil skills(target).stat(128)
    end
  end

  test 'point' do
    Skill.mode = :cxb
    [:skill_cxb_fixed].each do |target|
      assert_same_each_music_diff skills(target), 'point'
      assert_nil skills(target).point(128)
    end
  end

  test 'gauge' do
    Skill.mode = :cxb
    [:skill_cxb_fixed].each do |target|
      assert_same_each_music_diff skills(target), 'gauge'
      assert_nil skills(target).gauge(128)
    end
  end

  test 'combo' do
    Skill.mode = :cxb
    [:skill_cxb_fixed].each do |target|
      assert_same_each_music_diff skills(target), 'combo'
      assert_nil skills(target).combo(128)
    end
  end

  test 'locked' do
    Skill.mode = :cxb
    [:skill_cxb_fixed].each do |target|
      assert_same_each_music_diff skills(target), 'locked'
      assert_nil skills(target).locked(128)
    end
  end

  test 'calc!' do
    Skill.mode = :cxb
    skill = Skill.new(user: User.new, music: musics(:cxb_wannabe))
    skill.calc!
    assert_nil skill.best_point
    assert_nil skill.best_diff
    assert_nil skill.l_best_point
    assert_nil skill.l_best_diff

    skill.stat2 = SKILL_STAT_CLEARED
    skill.rate2 = 96
    skill.gauge2 = SKILL_GAUGE_NORMAL
    skill.locked2 = true
    skill.calc!
    assert_not skill.rate2_f
    assert_equal musics(:cxb_wannabe).level2 * 0.96, skill.point2
    assert_equal 0.00, skill.best_point
    assert_nil skill.best_diff
    assert_equal musics(:cxb_wannabe).level2 * 0.96, skill.l_best_point
    assert_equal MUSIC_DIFF_STD, skill.l_best_diff

=begin
    skill.stat2 = SKILL_STAT_CLEARED
    skill.rate2 = 96
    skill.gauge2 = SKILL_GAUGE_NORMAL
    skill.calc!
    assert_not skill.rate2_f
    assert_equal musics(:cxb_wannabe).level2 * 0.96, skill.point2
    assert_equal musics(:cxb_wannabe).level2 * 0.96, skill.best_point
    assert_equal MUSIC_DIFF_STD, skill.best_diff
    assert_equal musics(:cxb_wannabe).level2 * 0.96, skill.l_best_point
    assert_equal MUSIC_DIFF_STD, skill.l_best_diff
=end
  end
end
