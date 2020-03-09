require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a new user object' do
      user = User.new(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')

      expect(user).to be_valid
    end

    it 'should be invalid without a password value' do
      user = User.new(name: 'test', email: 'test@test.com', password: nil, password_confirmation: 'some test')

      expect(user).to_not be_valid
    end

    it 'should be invalid without a password confirmation value' do
      user = User.new(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: nil)

      expect(user).to_not be_valid
    end    

    it 'should have the same password and password_confirmation values' do
      user = User.new(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')

      expect(user.password).to eql(user.password_confirmation)
    end
  end
end
