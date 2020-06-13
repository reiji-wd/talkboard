class Comment < ApplicationRecord
  validates :content,  presence: true, if: -> { image.blank? }, length: { maximum: 255 }
  validates :image, presence: true, if: -> { content.blank? }
  
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  belongs_to :room
end
