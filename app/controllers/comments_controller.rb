class CommentsController < ApplicationController
  before_action :load_review, only: [:create, :destroy, :new]

  load_and_authorize_resource

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.review_id = @review.id
    if @comment.save
      respond_to do |format|
        format.html{redirect_to request.referrer}
        format.js
      end
    else
      flash[:danger] = t "review_fail"
      render :comment_form
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html{redirect_to request.referrer}
        format.js
      end
    else
      flash[:danger] = t "review_delete_fail"
      redirect_to request.referrer
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end

  def load_review
    @review = Review.find_by id: params[:review_id]
    return if @review
    flash[:danger] = t "no_data"
    redirect_to root_path
  end
end
