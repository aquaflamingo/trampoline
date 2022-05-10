# frozen_string_literal: true

Rails.application.routes.draw do
  # FIXME: Signed in / out
  root to: 'jobs#index'

  resources :secrets

  resources :jobs do
    member do
      get :download
    end
  end
end
