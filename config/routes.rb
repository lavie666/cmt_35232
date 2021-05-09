Rails.application.routes.draw do
  devise_for :users
  root to: 'clients#index'
  resources :clients do
    collection do
      get 'search'
    end
    resources :calendars, only: [:index, :create, :show, :destroy]
  end
    resources :users, only: :show
end
