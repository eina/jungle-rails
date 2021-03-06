require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a new user object' do
      user = User.new(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')

      expect(user).to be_valid
    end

    it 'should be invalid without an email value' do
      user = User.new(name: 'test', email: '', password: 'password', password_confirmation: 'password')

      expect(user).to_not be_valid
    end

    it 'should be invalid without a name value' do
      user = User.new(name: nil, email: 'test@test.com', password: 'password', password_confirmation: 'password')

      expect(user).to_not be_valid
    end    

    it 'should be invalid without a password value' do
      user = User.new(name: 'test', email: 'test@test.com', password: nil, password_confirmation: 'some test')

      expect(user).to_not be_valid
    end

    it 'should be invalid without a password confirmation value' do
      user = User.new(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: nil)

      expect(user).to_not be_valid
    end

    it 'should have a password with 4 or more characters' do
      user = User.new(name: 'test', email: 'test@test.com', password: '123', password_confirmation: '123')

      expect(user).to_not be_valid
    end

    it 'should have the same password and password_confirmation values' do
      user = User.new(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')

      expect(user.password).to eql(user.password_confirmation)
    end

    context 'Email Validation' do
      before do
        user1 = User.new(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
        user1.save!
      end

      it 'should be invalid if email is not unique' do   
        user2 = User.new(name: 'test', email: 'TEST@test.com', password: 'test', password_confirmation: 'test')
        # user2 = user1.dup
        user2.save
        expect(user2).to_not be_valid
      end
    end

  end

  describe '.authenticate_with_credentials' do
    before do
      login_user = User.new(name: 'trial', email: 'trial@trial.com', password: 'password', password_confirmation: 'password')
      login_user.save
    end

    it 'should log in a valid user' do
      user = User.authenticate_with_credentials('trial@trial.com', 'password')
      expect(user).to_not be_nil
    end

    it 'should be invalid if there is no email present' do
      user = User.authenticate_with_credentials('', 'test')
      expect(user).to be_nil
    end

    it 'should be invalid if there is no password present' do
      user = User.authenticate_with_credentials('test@test.com', nil)
      expect(user).to be_nil
    end

    it 'should login if there are spaces before and after email' do
      user = User.authenticate_with_credentials('       trial@trial.com               ', 'password')
      expect(user).to_not be_nil
    end

    it 'should normalize an email with capitals and log in' do
      user = User.authenticate_with_credentials('TRIAL@TRIAL.com', 'password')
      expect(user).to_not be_nil
    end
  end

end
