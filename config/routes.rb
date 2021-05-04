Rails.application.routes.draw do
  root to: 'clients#index'
  resources :clients, only: [:index, :new, :create]
end
