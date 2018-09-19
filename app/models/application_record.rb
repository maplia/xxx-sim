class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private
  def valid_diff?(diff)
    MUSIC_DIFFS.keys.include? diff
  end
end
