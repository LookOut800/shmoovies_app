Rails.application.routes.draw do
  resources :users, defaults: {format: :json}, only: [:create] do
    post 'sign_in', on: :collection
  end
  resources :movies, only: [:index, :create, :show] do
    resources :reviews, only: [:show, :create]
  end

end
