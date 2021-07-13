Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :providers
  resources :patients
  resources :visits
end
