class Space < ApplicationRecord
  validates :name, :address, :category, :price, presence: true
  mount_uploader :cover_image, PhotoUploader
  belongs_to :user, foreign_key: 'owner_id'
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search,
                   against: [:category],
                   using: {
                    tsearch: { prefix: true }
                   }
end
