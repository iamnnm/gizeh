Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: 'sign_in'
    get 'sign_up', to: 'devise/registrations#new', as: 'sign_up'
    get 'sign_out', to: 'devise/sessions#destroy', as: 'sign_out'
  end

  root to: 'articles#index'
  resources :articles do
    resources :comments, only: %i[create update destroy]
  end
  resources :users
end
