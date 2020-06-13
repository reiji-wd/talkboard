class Room < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  
  has_many :comments, dependent: :destroy

end
