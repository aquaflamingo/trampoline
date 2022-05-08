Rails.application.routes.draw do
  get 'secrets/new'
  get 'secrets/index'
  get 'secrets/create'
  get 'secrets/destroy'
  # FIXME: Signed in / out
  root to: 'jobs#index'

  resources :jobs do 
    member do 
      get :download
    end
  end
end
