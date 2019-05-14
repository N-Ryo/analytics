Rails.application.routes.draw do
  root 'reports#index'
  get 'reports/show'
  devise_for :sites
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :pvs
    end
  end
end
