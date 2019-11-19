class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :phone_number, presence: true
  mount_uploader :avatar, PhotoUploader
  has_many :spaces, foreign_key: 'owner_id'
  has_many :bookings
end
