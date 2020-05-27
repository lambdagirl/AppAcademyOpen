Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create] 
  resources :sessions, only: [:destory, :new, :create] 

  resources :posts
end