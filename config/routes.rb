NkuRails::Application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :students, except: :edit
  resources :sessions

  get "signout", to: "sessions#destroy", as: :signout
  get "profile", to: "students#edit", as: :profile

  root to: "students#index"
end
