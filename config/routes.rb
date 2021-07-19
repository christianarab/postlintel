Rails.application.routes.draw do
  root to: "landing#index"
  # devise users
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
 
  resources :profiles
  resources :events

  resources :organizations do
    resources :follows 
    resources :events do
      resources :signups, only: [:create, :destroy]
      resources :comments do
        resources :likes, only: [:create, :destroy]
      end
      resources :likes, only: [:create, :destroy]
    end
  end
end
