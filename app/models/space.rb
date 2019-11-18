class Space < ApplicationRecord
  belongs_to :user
  validates :name, :address, :category, :price, presence: true
  mount_uploader :cover_image, PhotoUploader
end
