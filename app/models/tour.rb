class Tour < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :category
  belongs_to :travelling

  scope :order_new_tours, ->{order created_at: :desc}
  scope :search, (lambda do |travelling_ids|
    where travelling_id: travelling_ids if travelling_ids
  end)
  scope :where_time_start, ->(time_start){where "time_start >= ?", time_start}
end
