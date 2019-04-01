class UsersController < ApplicationController
  def show
    @booking = Booking.where(user_id: current_user.id)
  end
end
