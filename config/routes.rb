Rails.application.routes.draw do
  resources :providers
  resources :patients
  resources :visits
end
