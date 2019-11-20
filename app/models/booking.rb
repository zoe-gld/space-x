class Booking < ApplicationRecord
  belongs_to :space
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :date, presence: true, uniqueness: { scope: :space_id }
end
