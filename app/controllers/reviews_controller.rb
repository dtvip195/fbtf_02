class ReviewsController < ApplicationController
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
    if @review.destroy
      flash[:success] = t "review_delete_success"
    else
      flash[:danger] = t "review_detele_fail"
    end
    redirect_to request.referrer
  end

  private

  def review_params
    params.require(:review).permit :content, :picture, :rating
  end

  def load_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour
    flash[:danger] = t "no_data"
    redirect_to root_path
  end

  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    return if @review
    flash[:danger] = t "no_data"
    redirect_to root_path
  end
end
