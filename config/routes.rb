Rails.application.routes.draw do
  namespace :api do
    resources :reservations, only: [:index, :show, :edit, :update, :create]
    resources :users, only: [:index, :show, :edit, :update, :create]
    resources :courses, only: [:index, :show, :edit, :update, :create]
  end
end
