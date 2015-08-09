Rails.application.routes.draw do
  resources :panels do
    resources :cards
  end
  devise_for :users

  root to: 'panels#index'
end
