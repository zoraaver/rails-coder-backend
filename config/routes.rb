Rails.application.routes.draw do
  resources :users, only: [:create, :update, :destroy]
  resources :courses, only: [:index, :show, :update]
  resources :lessons, only: [:destroy, :show, :update, :create, :edit]
  resources :sections, only: [:create, :update, :destroy]
  resources :subsections, only: [:create, :update, :destroy]
  get "/validate", to: "users#validate"
  post "/login", to: "users#login"
  patch "/lessons/:id/complete_lesson", to: "lessons#complete_lesson"
  post "/test", to: "test#run_test"
end
