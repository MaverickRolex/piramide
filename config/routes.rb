Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification' }

  root "homes#index"

  get "dashboard", to: "dashboard#index"

  

  resources :users
  resources :products do
    post "search", on: :collection
  end
  resources :sales
  resources :sale_products
end
