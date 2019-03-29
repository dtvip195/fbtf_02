class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  has_many :likes, dependent: :destroy

  delegate :name, to: :user

  validates :content, presence: true
end
