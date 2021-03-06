Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'blogs#index'
  
  resources :contacts
  
  resources :blogs do
    collection do
      get :search
      get :tags
      get :tag_list
    end
  end
  
  resources :restaurants, only: [:index, :show] 
  namespace :admin do
    resources :restaurants, only: [:index, :new, :create, :show,  :edit, :destroy]
  end

  resources :categories, only: :index do
    member do
      get 'parent'
    end
  end

  resources :profiles, only: :index
  
end
