Rails.application.routes.draw do
  resources :codes, only: [:index, :show]
end
