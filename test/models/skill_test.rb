require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  test 'point' do
    assert_same skills(:skill_fixed).point(MUSIC_DIFF_ESY), skills(:skill_fixed).point1
    assert_same skills(:skill_fixed).point(MUSIC_DIFF_STD), skills(:skill_fixed).point2
    assert_same skills(:skill_fixed).point(MUSIC_DIFF_HRD), skills(:skill_fixed).point3
    assert_same skills(:skill_fixed).point(MUSIC_DIFF_MAS), skills(:skill_fixed).point4
    assert_same skills(:skill_fixed).point(MUSIC_DIFF_UNL), skills(:skill_fixed).point5
    assert_nil skills(:skill_fixed).point(128)
  end

=begin
  test 'calc!' do
    skill = skills(:skill_one_cxb_wannabe)
    skill.calc!
    assert_nil skill.point1

    skill = skills(:skill_one_cxb_wannabe)
    skill.stat2 = 1
    skill.rate2 = 98.0
    skill.calc!
    assert_same skill.point2, (skill.music.level2 * skill.rate2).to_i / 100.0
  end
=end
end
