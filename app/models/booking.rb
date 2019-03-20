class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  enum status: {waitting: 0, refuse: 1, approve: 2}
  validates :name, presence: true, length: {maximum: 10}
  validates :phonenumber, presence: true, numericality: true,
            length: {minimum: 9,
                     maximum: 11}
  validates :address, presence: true
  validates :quantity, presence: true

  scope :order_bookings, ->{order created_at: :desc}
end
