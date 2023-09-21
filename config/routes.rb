Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :apartments, except: [:show]
  resources :tenants, except: [:show]
  resources :leases, only: [:create, :destroy]
end
