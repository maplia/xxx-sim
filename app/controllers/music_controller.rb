class MusicController < ApplicationController
  def index
    @musics = Music.find_actives(params[:date]).order(:number)
  end
end
