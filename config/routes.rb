Rails.application.routes.draw do
  devise_for :users
  root to: 'spaces#home'

  resources :spaces
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
