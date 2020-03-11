class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    # raise email.inspect
    user = User.find_by(email: email.strip.downcase)

    if user && user.authenticate(password)
      user
    else 
      nil
    end
  end

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, presence: true, length: { minimum: 4 }, confirmation: true
  validates :password_confirmation, presence: true
end
