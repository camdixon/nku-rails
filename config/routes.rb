NkuRails::Application.routes.draw do
  resources :students, except: :edit do
    resources :attendances
  end
  resources :sessions
  resources :attendances

  get "sign_out", to: "sessions#destroy"
  get "profile", to: "students#edit"

  root to: "students#index"
end
