Rails.application.routes.draw do
  root 'reports#index'
  get 'reports/show'
  devise_for :sites
  namespace :api, { format: 'json' } do
    resources :products
  end
end
