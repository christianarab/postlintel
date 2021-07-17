class Profile < ApplicationRecord
  belongs_to :user
  
  # Retrieves list of comments given by user
  def comments_given(user)
    comments = Comment.where(user_id: user.id)
  end

  # Retrieves user given 'likes'
  def likes_given(user)
    likes = Like.where(user_id: user.id)
  end

  # Retrieves organization memberships/follows given by user
  def follows_given(user)
    follows = Follow.where(user_id: user.id)
  end
end
