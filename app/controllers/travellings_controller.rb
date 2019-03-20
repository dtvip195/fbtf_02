class TravellingsController < ApplicationController
  def index
    @travellings = Travelling.all.group_travellings

    @travelling = if params[:location_end_id]
                    Travelling.where_travellings(params[:location_end_id])
                  else
                    Travelling.all
                  end

    @tours = Tour.search(@travelling.pluck(:id))
                 .where_time_start(Date.current)
                 .paginate(page: params[:page],
                   per_page: Settings.tours.per_page)
  end
end
