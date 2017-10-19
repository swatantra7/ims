Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'high_voltage/pages#show', id: 'about'

  namespace :admin do
    resources :members
    resources :courses
    resources :documents
  end

  authenticated :user do
    root 'admin/courses#index', as: :authenticated_root
  end

  resources :documents

end
