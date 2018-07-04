# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :tickets, shallow: true

  resource :search, only: %i[new show edit] do
    post '/' => 'searches#search'
  end

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end

    resources :railway_stations do
      patch :update_position, on: :member
    end

    resources :routes

    resources :tickets
  end

  root 'welcome#index'
end
