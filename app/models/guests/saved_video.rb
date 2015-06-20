module Guests
  class SavedVideo
    attr_reader :guest, :video

    def initialize(guest, video)
      @guest, @video = guest, video
    end

    def to_partial_path
      'saved_videos/saved_video'
    end
  end
end
