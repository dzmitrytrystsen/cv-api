class User < ApplicationRecord
  # Validations
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  validates :password_confirmation, presence: true,
  length: { minimum: 6 },
  if: -> { new_record? || !password.nil? }

  # Encrypt password
  has_secure_password
end
