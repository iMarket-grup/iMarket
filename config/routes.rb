Rails.application.routes.draw do

  get 'cart/index'
  root 'posts#index'
  
  devise_for :users

  devise_scope :user do  
     get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  resources :admins
  resources :categories
  resources :posts,       except: [:update, :edit, :destroy] do
    collection do 
      get 'add_cart/:id', to: 'posts#add_cart', as: 'add_cart'
    end
  end
  resources :comments
  resources :rates
  resources :comments
  resources :occupants

  
 
  get '/search' => 'pages#search', :as => 'search_page'
end
