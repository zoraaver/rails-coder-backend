Rails.application.routes.draw do
  resources :users, only: [:create, :update, :destroy]
  resources :courses, only: [:index, :show, :update]
  resources :lessons, only: [:show, :update]
  resources :sections, only: [:create, :update, :destroy]
  get "/validate", to: "users#validate"
  post "/login", to: "users#login"
  post "/test", to: "test#run_test"
end
