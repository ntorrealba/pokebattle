Rails.application.routes.draw do
  devise_for :users
  # resources :favorites
  # resources :pokemons
  # resources :users

  root 'pokemons#index'
  resources :users, except: [:index], shallow: true do
    resources :pokemons, except: [:index]
    resources :favorites
  end

  resources :pokemons, only: [:index]
  resources :battles, only: [:index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
