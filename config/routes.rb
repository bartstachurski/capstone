Rails.application.routes.draw do
  resources :friend_requests
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post '/users' => 'users#create'
    get '/users' => 'users#index'
    get '/users/:id' => 'users#show'
    post '/sessions' => 'sessions#create'
    post '/friend_requests' => 'friend_requests#create'
    get '/friend_requests' => 'friend_requests#index'
    delete '/friend_requests/:id' => 'friend_requests#destroy'
    patch '/friend_requests/:id' => 'friend_requests#update'
    post '/friendships' => 'friendships#create'
    delete '/friendships/:id' => 'friendships#destroy'
    get '/friendships' => 'friendships#index'
    get '/saved_breweries' => 'saved_breweries#index'
    patch '/saved_breweries/:id' => 'saved_breweries#update'
    delete '/saved_breweries/:id' => 'saved_breweries#destroy'
    post '/saved_breweries' => 'saved_breweries#create'
    get '/saved_breweries' => 'saved_breweries#index'
    get '/brewery_db_searches' => 'brewery_db_searches#index'
    post '/saved_brewery_groups' => 'saved_brewery_groups#create'
    get '/saved_brewery_groups' => 'saved_brewery_groups#index'
    delete '/saved_brewery_groups' => 'saved_brewery_groups#destroy'
    get '/brewery_db_searches/:id' => 'brewery_db_searches#show'
    get '/shared_groups' => 'shared_groups#index'
    post '/shared_groups' => 'shared_groups#create'
    get '/groups' => 'groups#index'
    post '/groups' => 'groups#create'
    get '/groups/:id' => 'groups#show'
    patch '/groups/:id' => 'groups#update'
    delete '/groups/:id' => 'groups#destroy'
    post '/groups' => 'groups#create'
    get '/untappd_venues' => 'untappd_venues#index'
    get '/untappd_venues/:id' => 'untappd_venues#show'
    get '/foursquare_venues' => 'foursquare_venues#index'
    get '/foursquare_venues/:id' => 'foursquare_venues#show'
    get '/untappd_breweries/:id' => 'untappd_breweries#show'
    post '/aws_s3_group_photos_uploads' => 'aws_s3_group_photos_uploads#create'
  end
end
