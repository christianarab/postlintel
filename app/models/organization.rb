class Organization < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :events
end
