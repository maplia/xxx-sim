require 'test_helper'

class SkillControllerTest < ActionDispatch::IntegrationTest
  test "should get max" do
    get skill_max_url
    assert_response :success
  end

end
