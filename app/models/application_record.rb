class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  @@mode = :cxb

  def self.mode=(mode)
    @@mode = mode
  end

  def self.music_diffs
    MUSIC_DIFFS[@@mode]
  end

  protected
  def mode
    @@mode
  end

  def music_diffs
    ApplicationRecord.music_diffs
  end

  def valid_diff?(diff)
    music_diffs.keys.include? diff
  end
end
