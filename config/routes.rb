Rails.application.routes.draw do


  get 'arts/random', to: 'arts#random'
  post '/arts/:id/up-vote', to: 'arts#up_vote'
  post '/arts/:id/down-vote', to: 'arts#down_vote'
  delete 'arts/:id/clear-vote', to: 'arts#clear_vote'
  patch 'arts/:id/toggle-vote', to: 'arts#toggle_vote'
  resources :arts, only: [:index, :show]

  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]

end
