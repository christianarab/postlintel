Rails.application.routes.draw do
  root to: "landing#index"

  devise_for :users
  
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  resources :users

  resources :events

  resources :organizations do
    resources :follows
    resources :events do
      resources :signups, only: [:create, :destroy]
      resources :comments
    end
  end
end
