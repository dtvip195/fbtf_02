class BookingsController < ApplicationController
  before_action :find_tour, only: [:new, :create, :destroy]
  before_action :check_quanlity, :load_booking, only: :create
  before_action :find_booking, only: :destroy

  authorize_resource

  def new
    @booking = current_user.bookings.new
  end

  def create
    ActiveRecord::Base.transaction do
      @booking.save!
      @tour.recent_quantity += @booking.quantity
      @tour.update_attributes!(recent_quantity: @tour.recent_quantity)
      flash[:success] = t "booking_success"
    rescue ActiveRecord::RecordInvalid
      flash[:danger] = t "booking_fail1"
    end
    redirect_to request.referrer
  end

  def destroy
    @tour.recent_quantity -= @booking.quantity
    if @booking.destroy
      @tour.update_attributes(recent_quantity: @tour.recent_quantity)
      flash[:success] = "success"
    else
      flash[:danger] = "fail"
    end
  end

  private

  def check_quanlity
    @count = @tour.max_quantity - @tour.recent_quantity
    return unless @count < params[:booking][:quantity].to_i
    flash[:danger] = t "booking_fail"
    redirect_to request.referrer
  end

  def load_booking
    @booking = current_user.bookings.new booking_params
    @booking.tour_id = @tour.id
    @booking.quantity = params[:booking][:quantity]
    @booking.bill = @booking.quantity * @tour.price
  end

  def booking_params
    params.require(:booking).permit :name, :phonenumber,
      :address, :quantity, :note
  end

  def find_tour
    @tour = Tour.find_by id: params[:tour_id]
    return if @tour
    flash[:danger] = t "no_data"
    redirect_to root_path
  end

  def find_booking
    @booking = Booking.find_by id: params[:booking_id]
    return if @booking
    flash[:danger] = t "no_data"
    redirect_to root_path
  end
end
