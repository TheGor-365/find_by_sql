Rails.application.routes.draw do
  root "pages#home"

  resources :posts
  resources :comments
end
