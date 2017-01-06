Rails.application.routes.draw do
  get 'messages/new'

  get '/chatlist', to: 'chats#new'

  get '/signup', to: 'users#new'

  root 'pages#home'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
