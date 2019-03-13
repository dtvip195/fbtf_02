class ToursController < ApplicationController
  before_action :load_tour_details, :current_user, only: :show

  def show
    @reviews1 = @tour_details.reviews.to_a
    avg_rating

    @review  = current_user.reviews.build if logged_in?
    @reviews = @tour_details.reviews.order_reviews
                            .paginate(page: params[:page],
                              per_page: Settings.review.per_page)
  end

  private

  def load_tour_details
    @tour_details = Tour.find_by id: params[:id]
    return if @tour_details
    flash[:danger] = t "no_data"
    redirect_to tour_path
  end

  def avg_rating
    @avg_rating = if @reviews1.blank?
                    0
                  else
                    @tour_details.reviews.average(:rating)
                  end
  end
end
