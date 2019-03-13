class LikesController < ApplicationController
  before_action :find_review, only: [:index, :create]
  before_action :current_user, only: [:show, :destroy]
  before_action :find_like, only: [:destroy]
  before_action :load_tour, only: [:create, :destroy]

  def create
    if already_liked?
      flash[:danger] = t "like_fail"
    else
      @like = current_user.likes.create(review_id: @review.id)
    end
    redirect_to @tour
  end

  def destroy
    return redirect_to @tour if @unlike.destroy
    flash[:danger] = t "fail"
    redirect_to @tour
  end

  private

  def find_review
    @review = Review.find_by id: params[:review_id]
    return if @review
    flash[:danger] = t "no_data"
    redirect_to root_path
  end

  def load_tour
    @tour = Tour.find_by id: params[:tour_id]
    return if @tour
    flash[:danger] = t "no_data"
    redirect_to root_path
  end

  def already_liked?
    Like.where(user_id: current_user.id, review_id:
      params[:review_id]).exists?
  end

  def find_like
    @unlike = Like.find_by id: params[:like_id]
    return if @unlike
    flash[:danger] = t "no_data"
    redirect_to root_path
  end
end
