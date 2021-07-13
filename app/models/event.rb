class Event < ApplicationRecord
  belongs_to :organization
  has_many :comments, as: :commentable
end
