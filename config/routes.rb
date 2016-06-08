Rails.application.routes.draw do


  devise_for :users

  root 'welcome#index'
  resources :about_us
  resources :cardapio
  resources :delivery
  resources :orders

  resources :pizzas, only: [:show, :index]
  resources :sizes, only: [:show, :index]

namespace :admin do
  resources :pizzas
  resources :sizes
end


end