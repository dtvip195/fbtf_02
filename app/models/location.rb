class Location < ApplicationRecord
  has_many :travellings_start_id, class_name: Travelling.name,
    foreign_key: :location_start, dependent: :destroy
  has_many :travellings_end_id, class_name: Travelling.name,
    foreign_key: :location_end, dependent: :destroy

  before_validation :delete_end_space
  validates :name, uniqueness: true, presence: true

  def delete_end_space
    self.name = self.name.strip
  end

  scope :ordered_by_name, ->{order name: :desc}
end
