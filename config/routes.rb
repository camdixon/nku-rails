NkuRails::Application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :students, except: :edit
  resources :sessions
  resources :attendances

  get "sign_out", to: "sessions#destroy"
  get "profile", to: "students#edit"

  root to: "students#index"
end
