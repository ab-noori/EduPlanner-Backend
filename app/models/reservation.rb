class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :user, presence: true
  validates :course, presence: true

  validate :valid_date_range
end
