Rails.application.routes.draw do
  devise_for :users
  root to: 'spaces#home'

  resources :spaces do
    resources :bookings do
      resources :reviews
    end
  end
end
