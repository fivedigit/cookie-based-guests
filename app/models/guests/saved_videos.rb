module Guests
  class SavedVideos
    include Enumerable

    delegate :each, to: :to_ary

    def initialize(store)
      @store = store
    end

    def include?(video)
      ids.include?(video.id)
    end

    def <<(video)
      @store[:saved_for_later] = JSON.generate(ids << video.id)
    end

    # Is called by ActionView when rendering a collection
    def to_ary
      Video.where(id: ids).map do |video|
        Guests::SavedVideo.new(self, video)
      end
    end

    def destroy
      @store[:saved_for_later] = nil
    end

    private

    def ids
      return [] unless @store[:saved_for_later]

      JSON.parse(@store[:saved_for_later])
    end
  end
end
