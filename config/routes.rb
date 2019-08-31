Rails.application.routes.draw do
  root 'site_pages#home'
  get 'about', to: 'site_pages#about'
  get 'contact', to: 'site_pages#contact'

  resources :users
  resources :surpluses

  resources :organizations do
    resources :needs
  end
end
