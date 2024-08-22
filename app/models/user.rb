class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  before_save { self.email = email.downcase }
  before_save { self.name =  name.titleize }

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 100 },
  format: { with: VALID_EMAIL_REGEX, message: 'must be a valid email address' },
  uniqueness: { case_sensitive: false } 
  
  validates :password, presence: true 

  def self.from_omniauth(auth)
    user = find_by(email: auth.info.email)
    user ||= User.create(
      name: auth.info.name,
      email: auth.info.email,
      password: SecureRandom.alphanumeric(10)
    )
    user
  end
end
