Rails.application.routes.draw do
  # FIXME: Signed in / out
  root to: 'jobs#index'

  resources :jobs do 
    member do 
      post :download
    end
  end
end
