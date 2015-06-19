Rails.application.routes.draw do
  devise_for :users

  root 'videos#index'

  resources :videos do
    post :save, on: :member
  end
end
