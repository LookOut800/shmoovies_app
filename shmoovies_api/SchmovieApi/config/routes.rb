Rails.application.routes.draw do
  resources :movies, except: [:new, :edit] do
    resources :reviews, only: [:index, :show, :create, :update, :destroy]
  end

  resources :reviews, only: [:index, :create]
end
