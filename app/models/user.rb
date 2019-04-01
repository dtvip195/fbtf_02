class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :validatable, :confirmable

  has_many :bookings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_save :downcase_email

  enum role: {user: 0, admin: 1}

  validates :name, presence: true
  validates :phonenumber, presence: true, numericality: true,
            length: {minimum: Settings.user.min_phone,
                     maximum: Settings.user.max_phone}

  scope :all_except, ->(user){where.not(id: user)}

  private

  def downcase_email
    self.email = email.downcase
  end
end
