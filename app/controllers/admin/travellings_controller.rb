class Admin::TravellingsController < Admin::AdminBaseController
  before_action :check_permission
  before_action :load_travelling, only: %i(edit update destroy)
<<<<<<< HEAD
  before_action :load_location, only: %i(edit new)

  def index
    @travellings = Travelling.ordered_by_created.paginate page: params[:page],
      per_page: Settings.travelling_per_page
  end

  def edit; end
=======

  def index
    @travellings = Travelling.paginate page: params[:page],
      per_page: Settings.travelling_per_page
  end

  def edit
    @locations = Location.all.map{|e| [e.name, e.id]}
  end
>>>>>>> b0fff5c1fdc45cc8270e96f54be70a25df71a4ac

  def update
    if @travelling.update_attributes travelling_params
      flash[:success] = t "update_travelling_success"
      redirect_to admin_travellings_path
    else
      flash[:danger] = t "update_travelling_failed"
<<<<<<< HEAD
=======
      redirect_to request.referrer
>>>>>>> b0fff5c1fdc45cc8270e96f54be70a25df71a4ac
    end
  end

  def destroy
    if @travelling.destroy
      flash[:success] = t "del_travelling_success"
    else
      flash[:danger] = t "del_travelling_failed"
    end
<<<<<<< HEAD
    redirect_to admin_travellings_path
  end

  def new
=======
    redirect_to request.referrer
  end

  def new
    @locations = Location.all.map{|e| [e.name, e.id]}
>>>>>>> b0fff5c1fdc45cc8270e96f54be70a25df71a4ac
    @travelling = Travelling.new
  end

  def create
    @travelling = Travelling.new travelling_params
    if @travelling.save
      flash[:success] = t "add_travelling_success"
      redirect_to admin_travellings_path
    else
<<<<<<< HEAD
      render :new
=======
      flash[:danger] = t "add_travelling_failed"
      redirect_to request.referrer
>>>>>>> b0fff5c1fdc45cc8270e96f54be70a25df71a4ac
    end
  end

  private

  def load_travelling
    @travelling = Travelling.find_by id: params[:id]
    return if @travelling
    flash[:danger] = t "err_location"
    redirect_to admin_travellings_path
  end

<<<<<<< HEAD
  def load_location
    @locations = Location.all.map{|e| [e.name, e.id]}
  end

=======
>>>>>>> b0fff5c1fdc45cc8270e96f54be70a25df71a4ac
  def travelling_params
    params.require(:travelling).permit :location_start_id, :location_end_id
  end
end
