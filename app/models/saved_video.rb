class SavedVideo < ActiveRecord::Base
  belongs_to :video
  belongs_to :user

  scope :for_video, lambda { |video| where(video_id: video) }
end
