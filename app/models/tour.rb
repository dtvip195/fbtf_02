class Tour < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :category
  belongs_to :travelling

  validates :price, presence: true, numericality: {only_float: true}
  validates :max_quantity, presence: true,
    numericality: { less_than_or_equal_to: 100,  only_integer: true }
  validate :start_must_be_before_end_time
  validates :time_start, presence: true
  validates :time_end, presence: true

  scope :order_new_tours, ->{order created_at: :desc}
  scope :search, (lambda do |travelling_ids|
    where travelling_id: travelling_ids if travelling_ids
  end)
  scope :where_time_start, ->(time_start){where "time_start >= ?", time_start}

  def start_must_be_before_end_time
    return errors.add(:time_start, "must be before end time") if
      time_start > time_end
  end
end
