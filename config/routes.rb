Rails.application.routes.draw do
  root to: "landing#index"

  devise_for :users

  resources :events

  resources :organizations do
    post 'organization' => 'organization#edit'
    resources :follows
    resources :events do
      resources :signups, only: [:create, :destroy]
      resources :comments
    end
  end
end
