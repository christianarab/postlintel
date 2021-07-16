class Like < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :comment
end
