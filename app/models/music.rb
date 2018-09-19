class Music < ApplicationRecord
  @@pivot = nil

  has_one :monthly, -> do
    where 'span_s <= ? and span_e > ?', @@pivot || Time.now, @@pivot || Time.now
  end

  def self.pivot=(pivot)
    @@pivot = pivot
  end

  def self.find_actives(date_str=nil)
    musics = Music.where(activated: true)
    if date_str
      date = Date.parse(date_str)
      @@pivot = date
      musics = musics.where('added_at <= ?', date)
        .where('deleted = ? or deleted_at >= ?', false, date)
    else
      musics = musics.where(deleted: false)
    end
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
end
