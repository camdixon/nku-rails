NkuRails::Application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :students

  root to: "students#index"
end
