class User < ApplicationRecord
  has_many :jobs, dependent: :destroy #if user is deleted, all related job is deleted
  has_many :reviews, dependent: :destroy #if user is deleted, all related review is deleted
  attr_accessor :remember_token
  before_save { email.downcase! }

  # For hasing password using bcrypt
  has_secure_password

  # VALIDATIONS
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            presence: true,
            length: { maximum: 255, message: 'You sure?' },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true

  validates :password,
            length: { in: 6..20 }

            # Generates new token
            def User.new_token
              SecureRandom.urlsafe_base64
            end

            # Remembers a user in the database for use in persistent sessions.
            def remember
              self.remember_token = User.new_token
              update_attribute(:remember_digest, User.digest(remember_token))
            end

            # Returns true if the given token matches the digest.
            def authenticated?(remember_token)
              BCrypt::Password.new(remember_digest).is_password?(remember_token)
            end

            def forget
              update_attribute(:remember_digest, nil)
            end

  # Advanced Log-in
  class << self

  # Returns the hash digest of the given string.
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
                                                    BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end
end
