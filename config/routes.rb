Rails.application.routes.draw do
  resources :friend_requests
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post '/users' => 'users#create'
    get '/users' => 'users#index'
    post '/sessions' => 'sessions#create'
    post '/friendships' => 'friendships#create'
    get '/friendships' => 'friendships#index'
    get '/saved_breweries' => 'saved_breweries#index'
    patch '/saved_breweries/:id' => 'saved_breweries#update'
    delete '/saved_breweries/:id' => 'saved_breweries#destroy'
    post '/saved_breweries' => 'saved_breweries#create'
    get '/saved_breweries' => 'saved_breweries#index'
    get '/brewery_db_searches' => 'brewery_db_searches#index'
    get '/brewery_db_searches/:id' => 'brewery_db_searches#show'
    get '/groups' => 'groups#index'
    get '/groups/:id' => 'groups#show'
    patch '/groups/:id' => 'groups#update'
    delete '/groups/:id' => 'groups#destroy'
    post '/groups' => 'groups#create'
    get '/untappd_venues' => 'untappd_venues#index'
    get '/untappd_venues/:id' => 'untappd_venues#show'
    get '/foursquare_venues' => 'foursquare_venues#index'
    get '/foursquare_venues/:id' => 'foursquare_venues#show'
    get '/untappd_breweries/:id' => 'untappd_breweries#show'
  end
end
