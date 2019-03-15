class StaticPagesController < ApplicationController
  def home
    # @hot_tour = Travelling.select_hot_tour
    #                       .join_tour
    #                       .left_join_location_start
    #                       .left_join_location_end
    #                       .order_sum_quantity
    #                       .group_travelling_id
    #                       .limit(Settings.static_pages.hottour)

    # @new_tour = Travelling.select_new_tour
    #                       .join_tour
    #                       .join_location_start
    #                       .join_location_end
    #                       .order_created_at
    #                       .limit(Settings.static_pages.hottour)
  end
end
