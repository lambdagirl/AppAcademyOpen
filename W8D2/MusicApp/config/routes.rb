Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect('/challenges')
  resources :users, only: [:show, :new, :create] do 
    collection do
      get :activate
    end
  end
  resource :session, only: [:new, :create, :destroy]

  resources :challenges
  resources :notes, only: [:create, :destroy]
end
