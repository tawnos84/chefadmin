class User < ActiveRecord::Base
  #password saved in small letters to allow for validation
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 255 }
  #only allow emails that are in the correct format and are unique
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  #user password saved as a hash
  has_secure_password
  validates :password, length: { minimum: 6 }

end
