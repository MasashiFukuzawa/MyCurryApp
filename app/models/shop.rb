class Shop < ApplicationRecord
  include ImageUploader[:image]

  validates :name, presence: true, length: {maximum: 50}
  validates :phone, presence: true, format: {with: /\A\d{10}$|^\d{11}\z/}, uniqueness: true
  validates :address, presence: true, length: {maximum: 100}
  validates :area, :station, presence: true, length: {maximum: 20}
end
