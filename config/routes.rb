Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :sessions
  resources :gossips

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

=begin

get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


=end