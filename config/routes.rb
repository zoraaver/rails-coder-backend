Rails.application.routes.draw do
  resources :users, only: [:create, :update, :destroy]
  resources :courses, only: [:index, :show]
  resources :lessons, only: [:show]
  get "/validate", to: "users#validate"
  post "/login", to: "users#login"
  post "/test", to: "application#run_test"
end
