Rails.application.routes.draw do
  root 'reports#index'
  get 'reports/show'
  devise_for :sites
end
