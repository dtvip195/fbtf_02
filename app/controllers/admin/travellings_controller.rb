class Admin::TravellingsController < Admin::AdminBaseController
  before_action :check_permission
  before_action :load_travelling, only: %i(edit update destroy)
  before_action :load_location, only: %i(edit new)

  def index
    @travellings = Travelling.ordered_by_created.paginate page: params[:page],
      per_page: Settings.travelling_per_page
  end

  def edit; end

  def update
    if @travelling.update_attributes travelling_params
      flash[:success] = t "update_travelling_success"
      redirect_to admin_travellings_path
    else
      flash[:danger] = t "update_travelling_failed"
      redirect_to request.referrer
    end
  end

  def destroy
    if @travelling.destroy
      flash[:success] = t "del_travelling_success"
    else
      flash[:danger] = t "del_travelling_failed"
    end
    redirect_to request.referrer
  end

  def new
    @travelling = Travelling.new
  end

  def create
    @travelling = Travelling.new travelling_params
    if @travelling.save
      flash[:success] = t "add_travelling_success"
      redirect_to admin_travellings_path
    else
      flash[:danger] = t "add_travelling_failed"
      redirect_to request.referrer
    end
  end

  private

  def load_travelling
    @travelling = Travelling.find_by id: params[:id]
    return if @travelling
    flash[:danger] = t "err_location"
    redirect_to admin_travellings_path
  end

  def load_location
    @locations = Location.all.map{|e| [e.name, e.id]}
  end

  def travelling_params
    params.require(:travelling).permit :location_start_id, :location_end_id
  end
end
