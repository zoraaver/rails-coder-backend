Rails.application.routes.draw do
  resources :users, only: [:create, :update, :destroy]
  get "/validate", to: "users#validate"
  post "/login", to: "users#login"
  post "/test", to: "application#run_test"
end
