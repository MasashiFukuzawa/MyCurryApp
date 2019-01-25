class User < ApplicationRecord
  include ImageUploader[:image]

  has_one :profile
  accepts_nested_attributes_for :profile
  has_many :comments
  has_many :shop, through: :comments
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 4}, allow_nil: true

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.nickname
      user.email = "#{auth.info.nickname}-#{auth.uid}@example.com"
      user.password = "1111"
      user.build_profile(twitter_image: auth.info.image,
                        location: auth.info.location,
                        description: auth.info.description)
    end
  end
end