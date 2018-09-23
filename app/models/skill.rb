class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :music
  include Comparable

  def maximize!
    max_diff = music.max_diff
    send("stat#{max_diff}=", SKILL_STAT_CLEARED)
    send("rate#{max_diff}=", 100.0)
    send("gauge#{max_diff}=", gauges.keys.max)
    send("combo#{max_diff}=", SKILL_COMBOS_ALL.keys.max)
    calc!
  end

  def stat(diff)
    valid_diff?(diff) ? send("stat#{diff}") : nil
  end

  def point(diff)
    valid_diff?(diff) ? send("point#{diff}") : nil
  end

  def rate(diff)
    valid_diff?(diff) ? send("rate#{diff}") : nil
  end

  def gauge(diff)
    valid_diff?(diff) ? send("gauge#{diff}") : nil
  end

  def combo(diff)
    valid_diff?(diff) ? send("combo#{diff}") : nil
  end

  def locked(diff)
    valid_diff?(diff) ? send("locked#{diff}") : nil
  end

  def calc!
    changed = false
    music_diffs.keys.each do |diff|
      next unless music.level(diff)
      if diff_changed?(diff)
        level = music.level(diff)
        bonus_rate = SKILL_GAUGE_BONUS_RATES[gauge(diff)]
        if send("point#{diff}_changed?")
          send("rate#{diff}=", BigDecimal.new((point(diff) / bonus_rate).to_s).ceil(2) / level).floor(2) * 100
          send("rate_f#{diff}", false)
          changed = true
        else
          send("point#{diff}=", BigDecimal.new((level * (rate(diff).to_i / 100.0) * bonus_rate).to_s).floor(2))
          changed = true
        end
      end
    end

    if changed
      self.best_point = 0.00
      self.l_best_point = 0.00
      music_diffs.keys.sort.each do |diff|
        if point(diff)
          if !locked(diff) and point(diff) >= best_point
            self.best_point = point(diff)
            self.best_diff = diff
          end
          if point(diff) >= l_best_point
            self.l_best_point = point(diff)
            self.l_best_diff = diff
          end
        end
      end
    end
  end

  def <=>(other)
    best_point <=> other.best_point
  end

  private
  def gauges
    SKILL_GAUGES[self.mode]
  end

  def diff_changed?(diff)
    send("rate#{diff}_changed?") || send("point#{diff}_changed?") || send("gauge#{diff}_changed?")
  end
end
