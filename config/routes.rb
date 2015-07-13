Immucal::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :children, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :vaccines
  resources :vaccinations, only: [:update]

  root to: "static_pages#home"

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

end
