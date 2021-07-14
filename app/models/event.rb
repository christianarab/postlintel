class Event < ApplicationRecord
  belongs_to :organization
  has_many :comments, as: :commentable
  has_many :attendances, as: :attendable
end
