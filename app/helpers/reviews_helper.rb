module ReviewsHelper
  def check_like? user_id, review_id
    Like.find_by(user_id: user_id, review_id: review_id).present?
  end

  def like_likes review
    review.likes.size == Settings.likes.count_like ? t("like") : t("likes")
  end
end
