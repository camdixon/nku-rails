NkuRails::Application.routes.draw do
  resources :students, except: :edit do
    resources :attendances
  end
  resources :sessions
  resources :attendances
  resources :assignments
  post "assignments/upload", to: "assignments#upload", as: "assignments_upload"
  
  resource :seating_chart

  get "sign_out", to: "sessions#destroy"
  get "profile", to: "students#edit"

  root to: "seating_charts#show"
end
