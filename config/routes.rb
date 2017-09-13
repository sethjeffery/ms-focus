Rails.application.routes.draw do
  namespace :api do
    resource :basket, only: [:show] do
      post :add
      post :remove
      delete :remove
    end

    resources :products
  end
end
