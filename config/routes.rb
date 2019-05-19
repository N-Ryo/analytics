Rails.application.routes.draw do
  root 'reports#index'
  get 'reports/show'
  devise_scope :site do
    get '/sites/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :sites
  mount API::Root => '/api'
end
