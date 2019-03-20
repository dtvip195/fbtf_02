class ReviewsController < ApplicationController
  before_action :review_params, only: :create
  before_action :load_tour
  before_action :correct_user, only: :destroy

  def create
    @review = current_user.reviews.build(review_params)
    @review.tour_id = @tour.id
    if @review.save
      flash[:success] = t "review_success"
    else
      flash[:danger] = t "review_fail"
    end
    redirect_to request.referrer
  end

  def destroy
    @review.destroy
    redirect_to request.referrer
  end

  private

  def review_params
    params.require(:review).permit(:content, :picture)
  end

  def load_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour
    flash[:danger] = t "no_data"
    redirect_to root_path
  end

  def correct_user
    if is_admin?
      @review = Review.find_by(id: params[:id])
    else
      @review = current_user.reviews.find_by(id: params[:id])
    end
    return if @review
    flash[:danger] = t "no_data"
  end
end
