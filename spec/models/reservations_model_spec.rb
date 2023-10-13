require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { User.create(name: 'Melvin Bagley') }
  let(:course) do
    course = Course.create(
      name: 'React18 Full Course',
      description: 'This is a React18 complete full course to take you from a noob to a pro',
      fee: 1200,
      startDate: '2024-04-04'
    )
    course.image.attach(io: File.open('assets/images/react.png'), filename: 'react.png', content_type: 'image/png')
    course
  end
  let(:reservation) { Reservation.create(user_id: user.id, course_id: course.id, city: 'kigali', date: '2024-05-09') }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(reservation).to be_valid
    end

    it 'is not valid without a user' do
      reservation.user_id = nil
      expect(reservation).not_to be_valid
    end

    it 'is not valid without a course' do
      reservation.course_id = nil
      expect(reservation).not_to be_valid
    end

    it 'is not valid without a city' do
      reservation.city = nil
      expect(reservation).not_to be_valid
    end

    it 'is not valid without a date' do
      reservation.date = nil
      expect(reservation).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      expect(reservation.user).to eq(user)
    end

    it 'belongs to a course' do
      expect(reservation.course).to eq(course)
    end
  end

  describe 'additional scenarios' do
    it 'returns the correct user' do
      expect(reservation.user).to eq(user)
    end

    it 'returns the correct course' do
      expect(reservation.course).to eq(course)
    end
  end
end
