Rails.application.routes.draw do
  resources :organizations
  root 'site_pages#home'
  get 'about', to: 'site_pages#about'
  get 'contact', to: 'site_pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
