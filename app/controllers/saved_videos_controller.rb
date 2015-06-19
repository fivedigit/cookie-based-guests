class SavedVideosController < ApplicationController
  def index
    @saved_videos = current_user.saved_videos
  end
end
