Rails.application.routes.draw do
  get 'concept/show'

  get 'concept/index'

  resources :codes, only: [:index, :show]
end
