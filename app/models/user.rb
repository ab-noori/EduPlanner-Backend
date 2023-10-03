class User < ApplicationRecord
  has_many :reservations
  has_many :courses, through: :reservations

  validates :name, presence: true, length: { maximum: 255 }
end
