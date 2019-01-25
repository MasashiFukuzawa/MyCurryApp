class Shop < ApplicationRecord
  include ImageUploader[:image]

  has_many :comments
  has_many :users, through: :comments

  validates :name, presence: true, length: {maximum: 50}
  validates :phone, presence: true, phone: true, uniqueness: true
  validates :address, presence: true, length: {maximum: 100}
  validates :area, :station, presence: true, length: {maximum: 20}
end
