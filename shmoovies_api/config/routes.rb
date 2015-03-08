Rails.application.routes.draw do
  resources :movies, only: [:index, :create, :show] do
    resources :reviews, only: [:show, :create]
  end

end
