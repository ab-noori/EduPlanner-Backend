class User < ApplicationRecord
    has_many :reservations
    has_many :courses, through: :reservations
end
