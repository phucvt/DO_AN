Rails.application.routes.draw do
  
  resources :locations
  resources :categories
  resources :posts
  root 'posts#index'
  get 'signup'          => 'users#new'
  get 'about'           => 'static_pages#about'
  get 'login'           => 'sessions#new'
  post 'login'          => 'sessions#create'
  delete 'logout'       => 'sessions#destroy'
  resources :users
end
