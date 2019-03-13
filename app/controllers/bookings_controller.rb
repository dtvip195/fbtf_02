class BookingsController < ApplicationController
  before_action :find_tour, only: [:new, :create, :destroy]
  before_action :find_booking, only: :destroy
  # before_action :find_quantity, only: :show

  def new
    # @quantity = params[:quantity]
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.new booking_params
    @booking.tour_id = @tour.id
    @count = @tour.max_quantity - @tour.recent_quantity
    @booking.quantity = params[:booking][:quantity] || 1
    @booking.bill = @booking.quantity * @tour.price
    save_booking
  end

  def destroy
    @tour.recent_quantity -= @booking.quantity
    if @booking.destroy
      @tour.update_attributes(recent_quantity: @tour.recent_quantity)
      flash[:success] = "success"
    else
      flash[:danger] = "fail"
    end
    redirect_to request.referrer
  end

  private

  def save_booking
    if @count < @booking.quantity
      flash[:danger] = t "booking_fail"
      redirect_to request.referrer
    elsif @booking.save
      @tour.recent_quantity += @booking.quantity
      @tour.update_attributes(recent_quantity: @tour.recent_quantity)
      flash[:success] = t "booking_success"
      redirect_to root_path
    else
      flash[:danger] = t "booking_fail1"
      redirect_to request.referrer
    end
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

  # def find_quantity
  #   @quantity = params[:quantity]
  #   return if @quantity
  #   flash[:danger] = t "no_data"
  #   redirect_to root_path
  # end
end
