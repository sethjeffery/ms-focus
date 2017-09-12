Rails.application.routes.draw do
  namespace :api do
    resource :basket, only: [:show] do
      post :add
      post :remove
    end
  end
end
