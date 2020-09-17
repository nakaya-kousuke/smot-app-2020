class Image < ApplicationRecord
  belongs_to :store, optional: true

  mount_uploader :image_url, ImageUploader

  validates :image_url, presence: true
end
