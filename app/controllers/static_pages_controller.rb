class StaticPagesController < ApplicationController
  def home
    @new_tour = Tour.where_time_start(Date.current)
                    .order_new_tours
                    .limit(Settings.static_pages.new_tours)
  end
end
