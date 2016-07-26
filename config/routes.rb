Rails.application.routes.draw do
  resources :concepts, only: [:index, :show]
  resources :codes, only: [:index, :show]
end
