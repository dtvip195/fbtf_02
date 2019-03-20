class Admin::ToursController < Admin::AdminBaseController
  before_action :check_permission
  before_action :load_tour, only: %i(edit update destroy)

  def index
    @tours = Tour.paginate page: params[:page],
      per_page: Settings.travelling_per_page
  end

  def new
    @travellings = Travelling.all.map do |e|
      ["#{e.location_start.name} - #{e.location_end.name}", e.id]
    end
    @tour = Tour.new
  end

  def create
    @tour = Tour.new tour_params
    if @tour.save
      flash[:success] = t "add_tour_success"
      redirect_to admin_tours_path
    else
      flash[:danger] = t "add_tour_failed"
      redirect_to request.referrer
    end
  end

  def edit
    @travellings = Travelling.all.map do |e|
      ["#{e.location_start.name} - #{e.location_end.name}", e.id]
    end
  end

  def update
    if @tour.update_attributes tour_params
      flash[:success] = t "update_tour_success"
      redirect_to admin_tours_path
    else
      flash[:danger] = t "update_tour_failed"
      redirect_to request.referrer
    end
  end

  def destroy
    if @tour.destroy
      flash[:success] = t "update_tour_success"
    else
      flash[:danger] = t "update_tour_failed"
    end
    redirect_to request.referrer
  end

  private

  def load_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour
    flash[:danger] = t "err_tour"
    redirect_to admin_tours_path
  end

  def tour_params
    params.require(:tour).permit :category_id, :travelling_id, :price,
      :time_start, :time_end, :max_quantity
  end
end
