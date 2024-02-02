Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'registrations' }
  
  root                to: 'home#index'

  resources :locations do
    collection do
      post :import
    end
  end  
  resources :cars do
    patch   :status, on: :member
  end
  
  resources :employees do
    collection do
      post :import
    end
  end  

  
  resources :positions do
    collection do
      post :import
    end
  end  
  resources :brands do
    collection do
      post :import
    end
  end  
  resources :models do
    collection do
      post :import
    end
  end
  resources :customers do
    collection { post :import }
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
