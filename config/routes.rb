Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/test", to: "application#test"
  post "/test", to: "application#run_test"
end
