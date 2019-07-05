Rails.application.routes.draw do
  
  get '/recipe', to: 'recipe#index'

  get '/user', to: 'user#index'

  get '/home', to: 'home#top'
  
  get '/login', to: 'home#login'
  
  get '/signup', to: 'home#signup'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
