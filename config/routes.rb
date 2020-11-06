Rails.application.routes.draw do
  # Rotas personalizadas, fora da CRUD básica de Owner
  get 'owners/:id/address' => 'owners#address'
  get 'owners/:id/cats' => 'owners#cats'

  # Rotas fora da hierarquia, pois não dependem do owner
  get 'cats' => 'cats#index'

  # Owners
  resources :owners, only: [:index, :show, :create, :update, :destroy] do
    # Cats
    resources :cats, only: [:list, :show, :create, :update, :destroy]
  end
end
