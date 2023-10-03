class Course < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :fee, presence: true, numericality: {greater_than: 0}
  validates :date, presence: true
end
