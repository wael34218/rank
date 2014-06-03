Rails.application.routes.draw do

  resources :favourite_presets
  resources :favourite_categories
  resources :moment_categories

  mount ApiDocs::Engine => '/api_docs'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      post 'account' => "accounts#create"
      post 'account/tags' => "accounts#tags"
      get 'account/tag_leaders' => "accounts#tag_leaders"
      get 'account/friends' => "accounts#friends"
      get 'account/:id/ranked_friends' => "accounts#ranked_friends"

      post 'friends' => "friends#create"
      patch 'friend' => "friends#update"

      post 'moment' => "moments#create"
      get 'moment/categories' => "moments#categories"

      post 'message' => "messages#create"

      post 'ranking' => "rankings#create"
      get 'ranking/:id/vote_yes' => "rankings#vote_yes"
      get 'ranking/:id/vote_no' => "rankings#vote_no"
      get 'ranking/:id/bribe_approve' => "rankings#bribe_approve"
      get 'ranking/:id/bribe_reject' => "rankings#bribe_reject"

      post 'activity/:id/comment' => "activities#comment"
      post 'activity/:id/like' => "activities#like"
      get 'activities' => "activities#index"

      get 'favourite/categories' => "favourites#categories"
      get 'favourite/category/:id/presets' => "favourites#presets"
      post 'favourite' => "favourites#create"
      patch 'favourite/:id' => "favourites#update"
      delete 'favourite/:id' => "favourites#destroy"
      get 'favourites' => "favourites#index"
    end
  end
  root :to => "favourite_categories#index"
end
