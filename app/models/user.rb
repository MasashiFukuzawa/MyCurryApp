class User < ApplicationRecord
  include ImageUploader[:image]

  has_one :profile
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  validates :name, presence: true, length: {maximum: 50}

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.nickname
      user.email = "#{auth.info.nickname}-#{auth.uid}@example.com"
      user.password = "1111"
      user.profile.twitter_image = auth.info.image
      user.profile.location = auth.info.location
      user.profile.description = auth.info.description
    end
  end
end