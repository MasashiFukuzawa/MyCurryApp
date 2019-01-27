class Comment < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :user 
  belongs_to :shop

  validates :title, presence: true, length: {maximum: 100}
  validates :body, presence: true, length: {maximum: 800}
end
