# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
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
