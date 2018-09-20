class MusicController < ApplicationController
  def index
    Music.pivot = Date.parse(params[:date]) if params[:date]
    musics = Music.find_actives.order(:number)

    @music_set = {deleted: [], normal: [], monthly: []}
    musics.each do |music|
      if music.deleted?
        @music_set[:deleted] << music
      elsif music.monthly?
        @music_set[:monthly] << music
      else
        @music_set[:normal] << music
      end
    end
  end
end
