class Comment < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :user, counter_cache: true
  belongs_to :shop, counter_cache: true

  validates :body, presence: true, length: {maximum: 500}
end
