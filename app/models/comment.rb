class Comment < ApplicationRecord
  
  validates :content_or_image, presence: true
  
  private
  
  def content_or_image
    content.presence or image.presence
  end
  
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  belongs_to :room
  
  
end
