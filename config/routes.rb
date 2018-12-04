Rails.application.routes.draw do
  root to: 'users#new'
  resources :blogs do
    collection do 
      post :confirm 
    end 
  end
  resources :users, only: [:new, :create, :show] do 
    resources :favorites, only: [:index]
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
