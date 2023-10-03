class Course < ApplicationRecord
    has_many :reservations
    has_many :users, through: :reservations
end
