Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  devise_for :users
  resources :messages
  post '/create_message' => 'home#create_message'
   mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
