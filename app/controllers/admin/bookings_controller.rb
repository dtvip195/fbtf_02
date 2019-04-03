class Admin::BookingsController < Admin::AdminBaseController
  before_action :load_booking, only: :update

  def index
    @bookings = Booking.order_bookings.paginate page: params[:page],
      per_page: Settings.travelling_per_page
    respond_to do |format|
      format.html
      format.xls do
        filename = "Booking-#{Time.now.strftime('%Y%m%d%H%M%S')}.xls"
        send_data(@bookings.to_a.to_xls,
          type: "text/xls; charset=utf-8; header=present",
          filename: filename)
      end
    end
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
