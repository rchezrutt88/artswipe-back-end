Rails.application.routes.draw do


  get 'arts/random', to: 'arts#random'
  resources :arts, only: [:index, :show]

  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]

end
