class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, presence: true, length: { minimum: 4 }, confirmation: true
  validates :password_confirmation, presence: true
end
