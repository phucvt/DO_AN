Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'

  resources :locations
  resources :categories
  resources :posts do
    resources :reviews
    get :show
    member do
      post 'like'
      get 'like'
    end
  end
  root 'posts#index'
  get 'signup'          => 'users#new'
  get 'about'           => 'static_pages#about'
  get 'login'           => 'sessions#new'
  post 'login'          => 'sessions#create'
  delete 'logout'       => 'sessions#destroy'
  resources :users
end
