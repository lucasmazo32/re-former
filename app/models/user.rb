# frozen_string_literal: true

class User < ApplicationRecord
  SPACE = /\s/.freeze
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       format: { without: SPACE, message: 'The username should not have spaces' },
                       length: { in: 5..20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }, length: { maximum: 250 }
  validates :password, presence: true, length: { in: 6..20 }, allow_blank: false
  has_secure_password
end
