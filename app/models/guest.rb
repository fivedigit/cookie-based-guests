class Guest
  attr_reader :saved_videos

  def initialize(store)
    @saved_videos = Guests::SavedVideos.new(store)
  end

  def registered?
    false
  end

  def saved_for_later?(video)
    saved_videos.include?(video)
  end

  def save_for_later(video)
    return if saved_for_later?(video)

    saved_videos << video
  end

  def destroy
    saved_videos.destroy
  end

  alias_method :delete, :destroy
end
