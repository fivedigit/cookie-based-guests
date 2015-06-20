Rails.application.routes.draw do
  devise_for :users

  root 'videos#index'

  resources :videos do
    resource :saved_video, only: [:create, :destroy]
  end

  resources :saved_videos, only: :index
end
