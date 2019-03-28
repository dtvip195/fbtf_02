class StaticPagesController < ApplicationController
  def home
    @new_tour = Tour.where_time_start(Date.current)
                    .order_new_tours
                    .limit(Settings.static_pages.new_tours)
  end

  def search
    @locations = Location.ransack(name_cont: params[:q]).result
    @travellings = Travelling.search_travellings(@locations.pluck(:id))

    respond_to do |format|
      format.html do
        redirect_to index_path(location_end_id:
          @travellings.map(&:location_end_id))
      end
      format.json
    end
  end
end
