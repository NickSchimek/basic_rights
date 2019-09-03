Rails.application.routes.draw do
  root 'site_pages#home'
  get 'about', to: 'site_pages#about'
  get 'contact', to: 'site_pages#contact'
  get 'needs', to: 'needs#grouped_index'
  get 'surplus', to: 'surplus#grouped_index'

  resources :users

  resources :organizations do
    resources :needs
    resources :surplus
    resources :claims
  end
end
