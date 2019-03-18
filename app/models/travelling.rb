class Travelling < ApplicationRecord
  has_many :tours
  belongs_to :location_start, class_name: Location.name,
    foreign_key: :location_start_id
  belongs_to :location_end, class_name: Location.name,
    foreign_key: :location_end_id

  scope :group_travellings, ->{group(:location_end_id)}
  scope :where_travellings, ->(id){where(location_end_id: id)}
end
