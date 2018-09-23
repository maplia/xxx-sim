class SkillController < ApplicationController
  def max
    Skill.mode = SITE_MODE
    Music.pivot = Date.parse(params[:date]) if params[:date]
    musics = Music.find_actives

    @skill_set = {normal: [], monthly: []}
    max_user = User.new
    musics.each do |music|
      next if music.deleted?
      skill = Skill.new(user: max_user, music: music)
      skill.maximize!

      if skill.music.monthly?
        @skill_set[:monthly] << skill
      else
        @skill_set[:normal] << skill
      end
    end
    @skill_set.each do |k, v|
      v.sort!.reverse!
      if k == :normal
        @skill_set[k] = @skill_set[k][0, 20]
      end
    end
  end
end
