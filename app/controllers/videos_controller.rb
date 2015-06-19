class VideosController < ApplicationController
  def index
    @videos = Video.all

    respond_to(:html)
  end

  def new
    @video = Video.new

    respond_to(:html)
  end

  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to(action: :index) }
      else
        format.html { render('new') }
      end
    end
  end

  def edit
    @video = Video.find(params[:id])

    respond_to(:html)
  end

  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to(action: :index) }
      else
        format.html { render('edit') }
      end
    end
  end

  def save
    @video = Video.find(params[:id])

    current_user.saved_videos.create!(video: @video)
    flash.notice = 'Video saved for later.'

    respond_to do |format|
      format.html { redirect_to(action: :index) }
    end
  end

  private

  def video_params
    params.require(:video).permit(:name)
  end
end
