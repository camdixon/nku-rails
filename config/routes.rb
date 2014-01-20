NkuRails::Application.routes.draw do
  resources :posts
  root "welcome#index"
end
