class Organization < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :events, dependent: :delete_all
  has_many :follows
end
