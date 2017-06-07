# frozen_string_literal: true
Rails.application.routes.draw do
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  get '/allrecipes' => 'recipes#showall'
  resources :users, only: [:index, :show]
  resources :examples, except: [:new, :edit]
  resources :recipes, except: [:new, :edit] do
    resources :pictures, only: [:index, :create]
  end
  resources :pictures, only: [:show, :update, :destroy]
end
