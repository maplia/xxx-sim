class MusicController < ApplicationController
  def index
    @musics = Music.all.order(:number)
  end
end
