Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'
  get 'dashboard' => 'pages#dashboard', as: 'dashboard'

  resources :posts do 
    resources :comments
  end
  
end

