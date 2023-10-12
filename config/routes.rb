Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    resources :reservations, only: [:index, :show, :edit, :update, :create]
    resources :users, only: [:index, :show, :edit, :update, :create, :login] do
      collection do
        post 'login', to: 'users#login'
      end
    end
    resources :courses, only: [:index, :show, :edit, :update, :create, :destroy]
  end
end
