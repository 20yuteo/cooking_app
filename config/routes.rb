Rails.application.routes.draw do
  
  root 'home#top'
  
  get '/home', to: 'home#top'
  
  get '/recipe', to: 'recipe#index'

  get '/user', to: 'user#index'
  
  get '/user/edit/:id', to: 'user#edit'
  
  patch '/user/edit/:id', to: 'user#edit'
  
  patch '/user/update', to: 'user#update'
  
  get '/login', to: 'home#login'
  
  post '/login', to: 'home#makesure'
  
  get '/signup', to: 'home#signup'
  
  post '/signup', to: 'home#create'
  
  get '/logout', to: 'home#logout'
  
  get '/recipe/show/:id', to: 'recipe#show'
  
  post '/recipe/show/:id', to: 'recipe#show'
  
  patch '/recipe/show/:id', to: 'recipe#show'
  
  get '/recipe/delete/:id', to: 'recipe#delete'
  
  get '/recipe/post', to: 'recipe#post' 
  
  get '/recipe/edit/:id', to: 'recipe#edit'
  
  patch '/recipe/edit/:id', to:'recipe#re_submit'
  
  post '/recipe/submit', to: 'recipe#submit'
  
  get '/recipe/like/:id', to: 'recipe#like'
  
  post '/recipe/like/:id', to: 'recipe#like'
  
  get '/recipe/dislike/:id', to: 'recipe#dislike'
  
  delete '/recipe/dislike/:id', to: 'recipe#dislike'

end
