Rails.application.routes.draw do
  root to: 'spaces#home'

  devise_for :users
  resources :users, only: [:edit, :update]
  get 'my_account', to: 'users#show'

  get 'spaces', to: "spaces#index"

  resources :spaces, except: [:delete] do
    resources :bookings, except: [:new, :index, :show] do
      resources :reviews, except: [:new, :index, :show]
    end
  end
end
