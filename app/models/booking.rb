class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  enum status: {waitting: 0, rejected: 1, approved: 2}

  validates :name, presence: true, length: {maximum: 10}
  validates :phonenumber, presence: true, numericality: true,
            length: {minimum: 9,
                     maximum: 11}
  validates :address, presence: true
  validates :quantity, presence: true
end
