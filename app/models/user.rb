class User < ApplicationRecord
  has_many :projects, dependent: :destroy

  has_secure_password
  has_secure_token :auth_token

  VALID_USERNAME_REGEX = /\A^\w+\z/

  validates :username, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }, format: { with: VALID_USERNAME_REGEX } # rubocop:disable Layout/LineLength
  validates :password, presence: true, length: { minimum: 6 }

  before_validation :strip_username
  before_save :lowercase_username

  private

  def strip_username
    self.username = username.to_s.strip
  end

  def lowercase_username
    self.username = username.to_s.downcase
  end
end
