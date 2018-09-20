class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :music

  def point(diff)
    valid_diff?(diff) ? self.send("point#{diff}") : nil
  end

  def calc!
    MUSIC_DIFFS.keys.each do |diff|
      next unless music.level(diff)
    end
  end
end
