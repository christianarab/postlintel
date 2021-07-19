class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  validates :user_id, :presence => true, uniqueness: {scope: [:likeable_id, :likeable_type]}
end