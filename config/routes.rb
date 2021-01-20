Rails.application.routes.draw do
  resources :todos
  resources :users

  get "/" => "home#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

  post "users/login", to: "users#login"
end
