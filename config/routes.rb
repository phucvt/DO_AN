Rails.application.routes.draw do
  root 'static_pages#home'
  get 'signup'          => 'users#new'
  get 'about'           => 'static_pages#about'
  get 'login'           => 'sessions#new'
  post 'login'          => 'sessions#create'
  delete 'logout'       => 'sessions#destroy'
  resources :users
end
