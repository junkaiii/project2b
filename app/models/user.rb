class User < ApplicationRecord
before_save { email.downcase! }

# For hasing password using bcrypt
has_secure_password

#VALIDATIONS
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :email,
          presence: true,
          length: { maximum: 255, message: 'You sure?'},
          format: { with: VALID_EMAIL_REGEX },
          uniqueness: true


validates :password,
          length: { in: 6..20 }


end
