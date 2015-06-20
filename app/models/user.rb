class User < ActiveRecord::Base
  has_many :saved_videos

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  def registered?
    true
  end

  def saved_for_later?(video)
    saved_videos.for_video(video).exists?
  end

  def save_for_later(video)
    saved_videos.create!(video: video)
  end
end
