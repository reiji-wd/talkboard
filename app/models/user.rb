class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
  validates :profile, length: { maximum: 255 }
  
  has_secure_password
  
  has_many :comments, dependent: :destroy
  has_many :rooms, dependent: :destroy
  
  mount_uploader :image, ImageUploader
end
