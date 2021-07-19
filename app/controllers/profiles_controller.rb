class ProfilesController < ApplicationController
  helper_method :likes_given
  helper_method :comments_given
  PROFILES_PER_PAGE = 6
  
  def index
    @page = params.fetch(:page, 0).to_i
    @profiles = Profile.offset(@page * PROFILES_PER_PAGE).limit(PROFILES_PER_PAGE)
  end

  def all
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = Profile.create(profile_params)
    redirect_to @profile
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update!(profile_params)
    redirect_to @profile
  end

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


  private

  def profile_params
    params.permit(:tagline, :interests, :id, :user_id)
  end
end
