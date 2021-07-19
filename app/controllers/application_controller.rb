# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Helper methods
  helper_method :likes_given, :comments_given, :follows_given, :popularity_counter
 
  # Retrieves list of comments given by user
  def comments_given(user_id)
    comments = Comment.where(user_id: user_id)
  end

  # Retrieves user given 'likes'
  def likes_given(user_id)
    likes = Like.where(user_id: user_id)
  end

  # Retrieves organization memberships/follows given by user
  def follows_given(user_id)
    follows = Follow.where(user_id: user_id)
  end

  # Retrieves 'likes' recieved on events
  def popularity_counter(user_id)
    likes_counter = 0
    events = Event.all.where(user_id: user_id)
    events.each do |event| 
      likes_counter += event.likes.count
    end
      likes_counter
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :profile_photo])
  end
end