Rails.application.routes.draw do
  resources :movies, only: [:index, :create, :show] do
    resources :users, :reviews, only: [:show, :create]
      post 'sign_in', on: :collection
  end

end
