class Admin::BookingsController < Admin::AdminBaseController
  before_action :check_permission
  before_action :load_booking, only: :update
  def index
    @bookings = Booking.order_bookings.paginate page: params[:page],
      per_page: Settings.travelling_per_page
    @salary = Booking.sum(:bill)
  end

  def update
    return if @booking.status != "waitting"
    @status = params[:status]
    @tour = Tour.find_by(id: @booking.tour.id)
    @booking.update(status: @status)
    if @status == "refuse"
      @new_quantity = @tour.recent_quantity - @booking.quantity
      @tour.recent_quantity = @new_quantity
      @tour.save
    end
    redirect_to admin_bookings_path
  end

  private

  def load_booking
    @booking = Booking.find_by id: params[:id]
  end
end
