require 'rails_helper'

RSpec.describe Course, type: :model do
  before(:each) do
    @course = Course.new(
      name: 'React18 Full Course',
      description: 'This is a React18 complete full course to take you from a noob to a pro',
      fee: 1200,
      startDate: '2024-04-04'
    )
    @course.image.attach(io: File.open('assets/images/react.png'), filename: 'react.png', content_type: 'image/png')
  end

  it 'should be Valid with proper parameters' do
    expect(@course).to be_valid
  end

  it 'should not be Valid with Improper Parameters' do
    @course.name = nil
    expect(@course).to_not be_valid
  end

  it 'should Start off with no reservations' do
    expect(@course.reservations).to be_empty
  end

  it 'should Not allow Fees below 0' do
    @course.fee = -1200
    expect(@course).to_not be_valid
  end
end
