Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :courses, only: [:index, :show] do
  end
  resources :participations, only: [:create]
  root 'courses#index'
end
