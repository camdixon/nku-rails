NkuRails::Application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :students, except: :edit
  resources :sessions

  get "sign_out", to: "sessions#destroy", as: :sign_out
  get "profile", to: "students#edit", as: :profile

  root to: "students#index"
end
