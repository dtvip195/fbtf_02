class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :validatable, :confirmable,
    :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :bookings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_save :downcase_email

  enum role: {user: 0, admin: 1}

  validates :name, presence: true
  validates :phonenumber, allow_blank: true, numericality: true,
            length: {minimum: Settings.user.min_phone,
                     maximum: Settings.user.max_phone}

  scope :all_except, ->(user){where.not(id: user)}

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.confirmed_at = Time.current
      user.updated_at = Time.current
      user.save
    end
  end

  def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.facebook_data"] &&
                session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
