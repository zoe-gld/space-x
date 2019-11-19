Rails.application.routes.draw do
  devise_for :users
  root to: 'spaces#home'

  resources :spaces, except: [:delete] do
    resources :bookings, except: [:new, :index, :show] do
      resources :reviews, except: [:new, :index, :show]
    end
  end
end
