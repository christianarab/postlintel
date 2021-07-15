class Event < ApplicationRecord
  belongs_to :organization
  has_many :comments, as: :commentable
  has_many :signups
  # has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
  # has_many :followers, through: :received_follows, source: :follower
  def signed_up?(user)
    puts "This is the user ID: #{user.id}"
    # return false unless self.signups.include?(user.id)
    signup = signups.find { | signup | signup.user_id == user.id } 
    if signup.nil?
      false
    else
      true
    end
  end
end
