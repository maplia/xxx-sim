class Music < ApplicationRecord
  @@pivot = nil

  has_one :monthly, -> do
    where 'span_s <= ? and span_e > ?', @@pivot || Time.now, @@pivot || Time.now
  end

  def self.pivot=(pivot)
    @@pivot = pivot
  end

  def self.find_actives
    musics = Music.where(activated: true)
    if @@pivot
      musics = musics.where('added_at <= ?', @@pivot)
    end
    musics
  end

  def level(diff)
    valid_diff?(diff) ? self.send("level#{diff}") : nil
  end

  def notes(diff)
    valid_diff?(diff) ? self.send("notes#{diff}") : nil
  end

  def monthly?
    monthly.present?
  end

  def deleted?
    @@pivot ? (deleted_at.present? && deleted_at < @@pivot) : deleted
  end
end
