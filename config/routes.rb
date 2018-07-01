# frozen_string_literal: true

Rails.application.routes.draw do
  get 'tickets/new'
  get 'tickets/show'
  get 'tickets/create'
  get 'searches/show'
  get 'searches/search'
  resources :trains do
    resources :carriages, shallow: true
  end

  resources :railway_stations do
    patch :update_position, on: :member
  end

  resources :routes

  resource :search, only: [:new, :show, :edit] do
    post '/' => 'searches#search'
  end

  resources :tickets, shallow: true

  root 'welcome#index'
end
