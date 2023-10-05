Rails.application.routes.draw do
  namespace :api do
    resources :reservations, only: [:index, :show, :edit, :update, :create]
    resources :users, only: [:index, :show, :edit, :update, :create, :login] do
      collection do
        post 'login', to: 'users#login'
      end
    end
    resources :courses, only: [:index, :show, :edit, :update, :create]
  end
end
