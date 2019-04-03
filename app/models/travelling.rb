class Travelling < ApplicationRecord
  has_many :tours
  belongs_to :location_start, class_name: Location.name,
    foreign_key: :location_start_id
  belongs_to :location_end, class_name: Location.name,
    foreign_key: :location_end_id

  delegate :name, to: :location_start, prefix: :start
  delegate :name, to: :location_end, prefix: :end

  scope :ordered_by_created, ->{order created_at: :desc}

  scope :group_travellings, ->{group :location_end_id}
  scope :where_travellings, ->(id){where location_end_id: id}

  scope :search_travellings, (lambda do |location_ids|
    where location_end: location_ids
  end)
end
