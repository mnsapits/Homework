Rails.application.routes.draw do

  resources :users, only: [:create, :new, :show]

  resource :session, only: [:create, :destroy, :new]

  resources :subs
end
