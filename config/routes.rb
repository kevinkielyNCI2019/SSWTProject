Rails.application.routes.draw do
  
  
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  resources :orders do 
    resources:orderitems
  end
  
  devise_for :users do 
    resources :orders 
  end
  
  get '/checkout' => 'cart#createOrder'
  
  get 'cart/index'
  resources :items do
    resources :comments
    
  end
  root 'static_pages#home'
  
  get '/about' => 'static_pages#about'
  get '/help' => 'static_pages#help'
  get '/account' => 'static_pages#account'
  
  get '/login' => 'user#login'
  get '/logout' => 'user#logout'
  
  get 'cart/clear' => 'cart#clearCart'
  
  get '/cart/:id' => 'cart#add'
  
  get '/cart/remove/:id' => 'cart#remove'
  
  post '/search' => 'items#search'
  
  post '/filter' => 'items#filter'
  
  get '/cart/increase/:id' => 'cart#increase'
  
  get '/cart/decrease/:id' => 'cart#decrease'
  
  get '/cart' =>'cart#index'
  
  get '/paid/:id' => 'static_pages#paid'

  
 # get 'static_pages/home'
  #get 'static_pages/help'
   # get 'static_pages/about'
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
