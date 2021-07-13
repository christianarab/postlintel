Rails.application.routes.draw do
  root to: "landing#index"

  devise_for :users
  
  resources :organizations do
   resources :events do
    resources :comments
   end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
