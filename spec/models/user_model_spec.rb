require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Melvin Bagley') }

  it 'should be valid with proper parameters' do
    expect(user).to be_valid
  end

  it 'should not be valid with improper parameters' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'should begin with zero reservations' do
    expect(user.reservations).to be_empty
  end
end
