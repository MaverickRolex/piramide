Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification' }

  root "homes#index"

  get "dashboard/index", to: "dashboard#index"

  resources :users
  resources :products
end
