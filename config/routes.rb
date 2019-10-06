Rails.application.routes.draw do
  devise_for :users
  root 'site_pages#home'
  get 'about', to: 'site_pages#about'
  get 'contact', to: 'site_pages#contact'
  get 'needs', to: 'needs#grouped_index'
  get 'surplus', to: 'surplus#grouped_index'
  get 'admin', to: 'admin_tools#show'

  resources :users, only: [:index, :show, :destroy]

  resources :organizations, except: :new do
    resources :needs, only: [:index, :new, :create]
    resources :surplus, only: [:index, :new, :create]
    get 'claims', to: 'claims#org_index'
  end
  resources :surplus, only: [:show, :edit, :update, :destroy] do
    resources :claims
  end
  resources :needs, only: [:show, :edit, :update, :destroy] do
    resources :fulfillments
  end
end
