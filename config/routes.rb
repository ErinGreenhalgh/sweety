Rails.application.routes.draw do
  root "readings#new"
  resources :readings, only: [:new, :create]
end
