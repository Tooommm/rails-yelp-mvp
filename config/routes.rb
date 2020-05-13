Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:destroy]
end
