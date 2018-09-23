ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def assert_same_each_music_diff(obj, method_name)
    MUSIC_DIFFS_ALL.keys.each do |diff|
      assert_same obj.send("#{method_name}#{diff}"), obj.send("#{method_name}", diff)
    end
  end
end
