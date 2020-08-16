Rails.application.routes.draw do
  resources :tweets
  resources :users

  root 'top#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
