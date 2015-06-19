class Guest
  def initialize(store)
    @store = store
  end

  def registered?
    false
  end

  def saved_for_later?(video)
    saved_video_ids.include?(video.id)
  end

  def save_for_later(video)
    # TODO: amount restriction. Once maximum is reached, it overwrites the
    # oldest entry
    @store[:saved_for_later] = JSON.generate((saved_video_ids << video.id))
  end

  def saved_videos
    saved_video = Struct.new(:user, :video) do
      def to_partial_path
        SavedVideo.new.to_partial_path
      end
    end

    Video.where(id: saved_video_ids).map do |video|
      saved_video.new(self, video)
    end
  end

  def saved_videos_count
    saved_video_ids.count
  end

  private

  def saved_video_ids
    return [] unless @store[:saved_for_later]

    JSON.parse(@store[:saved_for_later])
  end
end
