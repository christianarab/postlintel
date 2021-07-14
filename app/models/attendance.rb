class Attendance < ApplicationRecord
  validates :user_id, :event_id, presence: true
  belongs_to :user
end