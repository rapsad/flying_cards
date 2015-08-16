Rails.application.routes.draw do
  resources :panels do
    resources :learn, only: [:index, :show]
    resources :cards
  end
  devise_for :users

  root to: 'panels#index'
end
