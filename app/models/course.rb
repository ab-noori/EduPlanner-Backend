class Course < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :fee, presence: true, numericality: { greater_than: 0 }
  validates :startDate, presence: true
end
