Rails.application.routes.draw do
  get 'bookings/create'
  get 'bookings/edit'
  get 'bookings/update'
  get 'bookings/delete'
  devise_for :users
  root to: 'spaces#home'

  resources :spaces do
    resources :bookings do
      resources :reviews
    end
  end
end
