# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :tickets, shallow: true

  resource :search, only: %i[new show edit] do
    post '/' => 'searches#search'
  end

  namespace :admin do
    get '/' => 'welcome#index'

    resources :trains do
      patch :update_number, on: :member
      resources :carriages, shallow: true
    end

    resources :railway_stations

    # TODO
    resources :routes do
      patch :update_name, on: :member
      resources :railway_stations, only: [] do
        patch :update_position, on: :member
      end
    end

    resources :tickets
  end

  root 'searches#show'
end
