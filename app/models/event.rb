class Event < ApplicationRecord
  belongs_to :organization
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :signups, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

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

  def find_like(user)
    like = likes.where(user_id: user.id.to_i)
  end
  
  def event_like?(user)
    puts "This is the user ID: #{user.id}"
    # return false unless self.signups.include?(user.id)
    like = likes.find { | like | like.user_id == user.id } 
    if like.nil?
      false
    else
      true
    end
  end
end
