class Admin::LocationsController < Admin::AdminBaseController
  before_action :check_permission
  before_action :load_location, except: %i(index create)

  def show; end

  def edit; end

  def update
    if @location.update_attributes location_params
      flash[:success] = t "update_location_success"
      redirect_to admin_locations_path
    else
      flash[:danger] = t "update_location_failed"
      redirect_to request.referrer
    end
  end

  def destroy
    if @location.destroy
      flash[:success] = t "del_location_success"
    else
      flash[:danger] = t "del_location_failed"
    end
    redirect_to request.referrer
  end

  def create
    @location = Location.new location_params
    if @location.save
      flash[:success] = t "add_location_success"
    else
      flash[:danger] = t "err_location"
    end
    redirect_to admin_locations_path
  end

  def index
    @location = Location.new
    @locations = Location.ordered_by_name.paginate page: params[:page],
      per_page: Settings.location_per_page
  end

  private

  def location_params
    params.require(:location).permit :name
  end

  def load_location
    @location = Location.find_by id: params[:id]
    return if @location
    flash[:danger] = t "err_location"
    redirect_to admin_locations_path
  end
end
