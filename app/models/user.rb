class User < ApplicationRecord
  include ImageUploader[:image]

  has_many :comments, dependent: :destroy
  has_many :shop, through: :comments
  has_many :likes, dependent: :destroy
  has_many :like_shops, through: :likes, source: :shop
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.nickname
      user.email = "#{auth.info.nickname}-#{auth.uid}@example.com"
      user.password = "1111"
      user.twitter_image = auth.info.image
      user.location = auth.info.location
      user.description = auth.info.description
    end
  end
end