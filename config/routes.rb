Rails.application.routes.draw do
  root "readings#new"
  resources :readings, only: [:new, :create]

  namespace "reports" do
    get "/new", to: "readings#new"
  end
end
