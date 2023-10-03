Rails.application.routes.draw do
  namespace :api do
    resources :reservations
    resources :users
    resources :courses
  end
end
