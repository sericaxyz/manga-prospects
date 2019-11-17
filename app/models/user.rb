class User < ApplicationRecord
 
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
  has_secure_password

  has_many :materials
  has_many :favorites
  has_many :favorite_materials, through: :favorites, source: 'material'
  
  has_many :comments 

end
