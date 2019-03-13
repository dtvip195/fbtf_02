class Tour < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :category
  belongs_to :travelling

  # select_tour_details
  scope :select_tour_details, (lambda do
    select("tours.title as title, tours.id as tour_id, tours.price as price,
      tours.time_start as time_start, tours.time_end as time_end,
      tours.recent_quantity as recent_quantity,
      tours.max_quantity as max_quantity,
      tours.description as des,l1.name as name_start,
      l2.name as name_end, tours.avatar as avatar")
  end)

  scope :where_tour_details, ->(id){where "tours.id = ?", id}

  # join_tables
  scope :join_travellings, (lambda do
    joins("JOIN travellings on travellings.id = tours.travelling_id")
  end)

  scope :join_location_start, (lambda do
    joins("join locations as l1 ON travellings.location_start_id = l1.id")
  end)

  scope :join_location_end, (lambda do
    joins("join locations as l2 ON travellings.location_end_id = l2.id")
  end)
end
