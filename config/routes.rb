Rails.application.routes.draw do
  get 'messages/new'

  get 'chats/new'

  get 'users/new'

  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
