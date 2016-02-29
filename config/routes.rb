Rails.application.routes.draw do

  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]

  # grabs random art
  get 'arts/random' => 'arts#random'

  resources :arts, except: [:new, :edit] do
    resources :votes, except: [:new, :edit]
  end


end
