class Api::BreweryDbSearchesController < ApplicationController

  def index
    # sandbox path:
    # response = HTTP.get("https://sandbox-api.brewerydb.com/v2/search/geo/point", :params => {key: ENV["BREWERY_DB_KEY_SANDBOX"], lat: params[:lat], lng: params[:lng]})

    # production path:
    # response = HTTP.get("https://api.brewerydb.com/v2/search/geo/point", :params => {key: ENV["BREWERY_DB_KEY_PRODUCTION"], lat: params[:lat], lng: params[:lng]})

    # production testing path to not use Google API requests up:
    response = HTTP.get("https://api.brewerydb.com/v2/search/geo/point", :params => {key: ENV["BREWERY_DB_KEY_PRODUCTION"], lat: params[:lat], lng: params[:lng]})
    @breweries = response.parse["data"]
    render 'index.json.jb'
  end

  def show
    response = HTTP.get("https://api.brewerydb.com/v2/location/#{params[:id]}", :params => {key: ENV["BREWERY_DB_KEY_PRODUCTION"]})
    @brewery = response.parse["data"]
    # beers_response = HTTP.get("https://api.brewerydb.com/v2/brewery/#{@brewery.breweryId}", :params => {key: ENV["BREWERY_DB_KEY_PRODUCTION"]})
    render 'show.json.jb'
  end
end
