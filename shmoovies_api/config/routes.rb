Rails.application.routes.draw do
  resources :movies, only: [:index, :create, :show, :update, :destroy] do
    resources :reviews, only: [:index, :show, :create, :update, :destroy]
  end

  resources :reviews, only: [:index, :create]
end
