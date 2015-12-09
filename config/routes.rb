Rails.application.routes.draw do
  
  get 'admin' => 'admin#home'

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  get 'list_post/appr'=>'posts#approve',as: :approve
  get 'list_post' => 'posts#list_post'
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
  post'/' => 'posts#search_post', as: :search_post
  root 'posts#index'
  get 'signup'          => 'users#new'
  get 'about'           => 'static_pages#about'
  get 'login'           => 'sessions#new'
  post 'login'          => 'sessions#create'
  delete 'logout'       => 'sessions#destroy'
  resources :users do
    resources :messages, only: [:index, :create, :show, :destroy]
  end
end
