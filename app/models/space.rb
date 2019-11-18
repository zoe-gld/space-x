class Space < ApplicationRecord
  validates :name, :address, :category, :price, presence: true
  mount_uploader :cover_image, PhotoUploader
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
end
