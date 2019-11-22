class Review < ApplicationRecord
  belongs_to :booking
  validates :title, presence: true
  validates :rating, presence: true, numericality: true, inclusion: { in: 1..5 }
end
