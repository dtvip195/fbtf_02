class Like < ApplicationRecord
  belongs_to :user
  belongs_to :review
  belongs_to :comment

  scope :already_liked, (lambda do |user_id, review_id|
    where user_id: user_id, review_id: review_id
  end)
end
