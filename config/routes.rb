Rails.application.routes.draw do
  root to: "landing#index"

  devise_for :users

  resources :organizations do
    resource :follows
    resources :events do
      resources :signups, only: [:create]
      resources :comments
    end
  end
end
