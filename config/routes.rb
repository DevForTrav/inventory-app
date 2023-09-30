Rails.application.routes.draw do
  
  
  root "home#index"
  
  resources :wiring_harnesses, as: 'wiring_harnesses' do
    resources :wiring_harness_connectors, as: 'connectors'
    resources :circuits
  end
  
  resources :splices
  
  resources :circuits, only: %i[index edit show new] do
    resources :splices
  end
  
  resources :errors
  resources :batches
  resources :connectors
  resources :prepops
  resources :terminals

  resources :uncut_wires

  devise_for :users
end