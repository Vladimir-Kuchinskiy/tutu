# frozen_string_literal: true

Rails.application.routes.draw do
  resources :trains do
    resources :carriages, shallow: true
  end

  resources :railway_stations do
    patch :update_position, on: :member
  end

  resources :routes

  resource :search, only: [:new, :show, :edit]

  root 'welcome#index'
end
