Rails.application.routes.draw do
  # Owners
  resources :owners, only: [:index, :show, :create, :update, :destroy] do
    # Addresses
    get 'addresses' => 'addresses#show'
    post 'addresses' => 'addresses#create'
    put 'addresses' => 'addresses#update'
    delete 'addresses' => 'addresses#destroy'
    # Cats
    resources :cats do
      # Facts
      resources :facts, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
