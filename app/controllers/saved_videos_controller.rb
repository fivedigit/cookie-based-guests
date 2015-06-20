class SavedVideosController < ApplicationController
  def index
    @saved_videos = current_user.saved_videos
  end

  def create
    video = Video.find(params[:video_id])

    current_user.save_for_later(video)
    flash.notice = 'Video saved for later.'

    respond_to do |format|
      format.html { redirect_to(videos_path) }
    end
  end
end
