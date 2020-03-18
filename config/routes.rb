Rails.application.routes.draw do
  get 'static_pages/home'
  devise_for :users, :path => '', path_names: { sign_in: "login", sign_out: "logout", sign_up: "registration"}
  root 'static_pages#home'
  resources :users
  resources :posts do
  	resources :comments
  end
end
