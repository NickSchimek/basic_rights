Rails.application.routes.draw do
  root 'site_pages#home'
  get 'about', to: 'site_pages#about'
  get 'contact', to: 'site_pages#contact'

  resources :users

  resources :organizations do
    resources :needs
    resources :surplus
  end
end
