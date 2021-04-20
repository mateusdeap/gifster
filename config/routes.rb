Rails.application.routes.draw do
  devise_for :users
  root to: "gifs#index"
  resources :gifs
end
