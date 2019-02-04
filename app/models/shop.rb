class Shop < ApplicationRecord
  include ImageUploader[:image]
  
  PHONE_REGEX = /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/

  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  
  validates :name, presence: true, length: {maximum: 50}
  validates :phone, presence: true, uniqueness: true, format: {with: PHONE_REGEX}
  validates :address, presence: true, length: {maximum: 100}
  validates :area, :station, presence: true, length: {maximum: 20}
  validates :google_map_url, presence: true

  scope :like_num, -> {order(likes_count: :desc)}
  scope :comment_num, -> {order(comments_count: :desc)}

  def like?(user)
    like_users.include?(user)
  end

  def self.search(search)
    if search
      where(['name LIKE ? or phone LIKE ? or address LIKE ? or area LIKE ? or station LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      all
    end
  end
end
