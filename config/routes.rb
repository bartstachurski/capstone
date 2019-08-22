Rails.application.routes.draw do
  resources :friend_requests
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'
    post '/friendships' => 'friendships#create'
    get '/saved_breweries' => 'saved_breweries#index'
    post '/saved_breweries' => 'saved_breweries#create'
    get '/brewery_db_searches' => 'brewery_db_searches#index'
    get '/brewery_db_searches/:id' => 'brewery_db_searches#show'
    get '/untappd_venues' => 'untappd_venues#index'
    get '/untappd_venues/:id' => 'untappd_venues#show'
    get '/untappd_breweries/:id' => 'untappd_breweries#show'
  end
end
