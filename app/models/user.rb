class User < ActiveRecord::Base
  has_many :saved_videos

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  def saved_for_later?(video)
    saved_videos.where(id: video).exists?
  end
end
