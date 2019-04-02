class LikesController < ApplicationController
  before_action :find_review, only: [:create, :destroy]

  authorize_resource

  def create
    if already_liked?
      flash[:danger] = t "like_fail"
      redirect_to request.referrer
    else
      current_user.likes.create!(review_id: params[:review_id])
      respond_to do |format|
        format.html{redirect_to request.referrer}
        format.js
      end
    end
  end

  def destroy
    @unlike = current_user.likes.find_by(review_id: params[:review_id])
    if already_liked?
      @unlike.destroy!
      respond_to do |format|
        format.html{redirect_to request.referrer}
        format.js
      end
    else
      flash[:danger] = t "fail"
      redirect_to request.referrer
    end
  end

  private

  def find_review
    @review = Review.find_by id: params[:review_id]
    return if @review
    flash[:danger] = t "no_data"
    redirect_to root_path
  end

  def already_liked?
    Like.already_liked(current_user.id, params[:review_id]).exists?
  end
end
