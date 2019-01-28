class Shop < ApplicationRecord
  include ImageUploader[:image]
  
  PHONE_REGEX = /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/

  has_many :comments
  has_many :users, through: :comments

  validates :name, presence: true, length: {maximum: 50}
  validates :phone, presence: true, uniqueness: true, format: {with: PHONE_REGEX}
  validates :address, presence: true, length: {maximum: 100}
  validates :area, :station, presence: true, length: {maximum: 20}
  validates :google_map_url, presence: true
end
