class Location < ApplicationRecord
  has_many :travellings_start_id, class_name: Travelling.name,
    foreign_key: :location_start, dependent: :destroy
  has_many :travellings_end_id, class_name: Travelling.name,
    foreign_key: :location_end, dependent: :destroy
end
