class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @booking = Booking.where(user_id: current_user.id)
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "msg_success"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :phonenumber, :password,
      :password_confirmation
  end
end
