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
    get '/brewery_db_searches' => 'brewery_db_searches#index'
    get '/brewery_db_searches/:id' => 'brewery_db_searches#show'
  end
end
