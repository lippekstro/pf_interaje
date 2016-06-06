Rails.application.routes.draw do


  devise_for :users

  root 'welcome#index'
  resources :about_us
  resources :cardapio

  resources :pizzas, only: [:show, :index]

namespace :admin do
  resources :pizzas
end


end