class Organization < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :events
  has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
  has_many :followers, through: :received_follows, source: :follower
end
