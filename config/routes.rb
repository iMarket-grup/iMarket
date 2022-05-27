Rails.application.routes.draw do
  get 'cart/index'
  root 'posts#index'
  
  devise_for :users
  resources :admins
  resources :categories
  resources :posts,       except: [:update, :edit, :destroy] do
    collection do 
      get 'add_cart/:id', to: 'posts#add_cart', as: 'add_cart'
    end
  end
  resources :comments
  resources :rates

  
 
  get '/search' => 'pages#search', :as => 'search_page'
end
