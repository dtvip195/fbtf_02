class ToursController < ApplicationController
  before_action :travel_end, only: :index

  def index
    travel_end
    if params[:name_end]
      if_tours
    else
      else_tours
    end
  end

  def show
    @tour_details = Tour.select_tour_details
                        .join_travellings
                        .join_location_start
                        .join_location_end
                        .where_tour_details(params[:tour_id])
  end

  private

  def travel_end
    @travel_end = Travelling.location_end.join_tour
                            .join_location_start
                            .join_location_end
                            .order_count.group_id_end
  end

  def if_tours
    @tours = Travelling.list_tours
                       .join_tour
                       .join_location_start
                       .join_location_end
                       .where_list_tours(params[:name_end])
                       .paginate(page: params[:page],
                        per_page: Settings.tours.per_page)
  end

  def else_tours
    @tours = Travelling.list_tours
                       .join_tour
                       .join_location_start
                       .join_location_end
                       .paginate(page: params[:page],
                        per_page: Settings.tours.per_page)
  end
end
