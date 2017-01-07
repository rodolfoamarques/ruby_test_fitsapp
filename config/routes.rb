Rails.application.routes.draw do

  root 'pages#home'

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/chatlist', to: 'chats#new'

  get '/new_message', to: 'messages#new'

  resources :users
  resources :messages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
