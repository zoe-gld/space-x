Rails.application.routes.draw do

  devise_for :users
  root to: 'spaces#home'

  get 'my_account', to: 'users#show'

  resources :spaces, except: [:delete] do
    resources :bookings, except: [:new, :index, :show] do
      resources :reviews, except: [:new, :index, :show]
    end
  end
end
