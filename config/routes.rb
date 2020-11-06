Rails.application.routes.draw do
  resources :owners, only: [:index, :show, :create, :update, :destroy]
end
