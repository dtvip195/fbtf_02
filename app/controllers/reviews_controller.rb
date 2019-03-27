class ReviewsController < ApplicationController
  before_action :load_tour, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @review = current_user.reviews.build(review_params)
    @review.tour_id = @tour.id
    if @review.save
      respond_to do |format|
        format.html{redirect_to request.referrer}
        format.js
      end
    else
      flash[:danger] = t "review_fail"
      redirect_to :review_form
    end
  end

  def destroy
    if @review.destroy
      respond_to do |format|
        format.html{redirect_to request.referrer}
        format.js
      end
    else
      flash[:danger] = t "review_detele_fail"
      redirect_to request.referrer
    end
  end

  private

  def review_params
    params.require(:review).permit :content, :picture, :rating
  end

  def load_tour
    @tour = Tour.find_by id: params[:tour_id]
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
