class Travelling < ApplicationRecord
  has_many :tours
  belongs_to :locations_start, class_name: Location.name,
    foreign_key: :location_start_id
  belongs_to :locations_end, class_name: Location.name,
    foreign_key: :location_end_id

  # # select_hot_tour
  # scope :select_hot_tour, (lambda do
  #   select("travellings.id as id,tours.price as price,
  #   l1.name as name_start,
  #   l2.name as name_end,
  #   sum(tours.recent_quantity) as sum_quantity,
  #   tours.avatar as avatar,
  #   tours.description as description,
  #   tours.time_start as time_start,
  #   tours.time_end as time_end")
  # end)

  # scope :left_join_location_start, (lambda do
  #   joins("LEFT JOIN locations as l1 ON travellings.location_start_id = l1.id")
  # end)

  # scope :left_join_location_end, (lambda do
  #   joins("LEFT JOIN locations as l2 ON travellings.location_end_id = l2.id")
  # end)

  # scope :order_sum_quantity, ->{order("sum_quantity desc")}
  # scope :group_travelling_id, ->{group("tours.travelling_id")}

  # # select_location_end
  # scope :location_end, (lambda do
  #   select("l2.name as name_end,
  #     l1.name as name_start, count(l1.name) as count,
  #     travellings.location_end_id as id_end")
  # end)

  # scope :order_count, ->{order("count desc")}
  # scope :group_id_end, ->{group("id_end")}

  # # list_tour
  # scope :list_tours, (lambda do
  #   select("tours.id as tour_id, tours.title as title,
  #     tours.recent_quantity as recent_quantity,
  #     tours.description as des,l1.name as name_start,
  #     l2.name as name_end, tours.price as price, tours.time_end as time_end,
  #     tours.time_start as time_start, tours.avatar as avatar")
  # end)

  # scope :where_list_tours, ->(name){where("l2.name = ?", name)}

  # # select_new_tour
  # scope :select_new_tour, (lambda do
  #   select("tours.id as tour_id, tours.title as title,
  #     tours.recent_quantity as recent_quantity,
  #     tours.description as des,l1.name as name_start,
  #     l2.name as name_end, tours.price as price, tours.time_end as time_end,
  #     tours.time_start as time_start,
  #     tours.avatar as avatar, tours.created_at")
  # end)

  # scope :order_created_at, ->{order("tours.created_at desc")}

  # # join_tables
  # scope :join_tour, (lambda do
  #   joins("JOIN tours on travellings.id = tours.travelling_id")
  # end)

  # scope :join_location_start, (lambda do
  #   joins("join locations as l1 ON travellings.location_start_id = l1.id")
  # end)

  # scope :join_location_end, (lambda do
  #   joins("join locations as l2 ON travellings.location_end_id = l2.id")
  # end)
end
