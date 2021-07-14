class Event < ApplicationRecord
  belongs_to :organization
  has_many :comments, as: :commentable
  has_many :attendees, through: :users, source: :user
end
