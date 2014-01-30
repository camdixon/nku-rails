NkuRails::Application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :students
  resources :sessions

  root to: "students#index"
end
