Rails.application.routes.draw do
  # get 'users/index'

  devise_for :users

  # resources :users, only: [:show] do
  #   resources :comments
  # end

  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'
  get 'dashboard' => 'pages#dashboard', as: 'dashboard'

  resources :posts do 
    resources :comments
  end
  
end

