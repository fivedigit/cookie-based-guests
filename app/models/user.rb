class User < ActiveRecord::Base
  has_many :saved_videos

  delegate :count, to: :saved_videos, prefix: true

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  def registered?
    true
  end

  def saved_for_later?(video)
    saved_videos.where(id: video).exists?
  end

  def save_for_later(video)
    saved_videos.create!(video: video)
  end
end
