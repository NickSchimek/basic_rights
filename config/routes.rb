Rails.application.routes.draw do
  root 'site_pages#home'
  get 'about', to: 'site_pages#about'
  get 'contact', to: 'site_pages#contact'
  get 'needs', to: 'needs#grouped_index'
  get 'surplus', to: 'surplus#grouped_index'

  resources :users

  resources :organizations do
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
