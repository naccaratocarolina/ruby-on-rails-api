Rails.application.routes.draw do
  # Owners
  resources :owners, only: [:index, :show, :create, :update, :destroy] do
    # Cats
    resources :cats do
      # Facts
      resources :facts, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
