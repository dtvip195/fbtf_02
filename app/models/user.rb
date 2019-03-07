class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy

  before_save :downcase_email

  enum role: {user: 0, admin: 1}

  validates :name, presence: true, length: {maximum: Settings.user.max_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.max_email},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :phonenumber, presence: true, numericality: true,
            length: {minimum: Settings.user.min_phone,
                     maximum: Settings.user.max_phone}

  has_secure_password
  validates :password, presence: true,
  length: {minimum: Settings.user.min_pass}, allow_nil: true

  private

  def downcase_email
    self.email = email.downcase
  end
end
