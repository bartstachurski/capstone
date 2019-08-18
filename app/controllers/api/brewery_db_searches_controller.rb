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
    @untappd_name = URI.escape(@brewery["brewery"]["name"])
    untappd_find_brewery = HTTP.get("https://api.untappd.com/v4/search/brewery?client_id=#{ENV["UNTAPPD_CLIENT_ID"]}&client_secret=#{ENV["UNTAPPD_CLIENT_SECRET"]}&q=#{@untappd_name}")
    @untappd_brewery_id = untappd_find_brewery.parse["response"]["brewery"]["items"][0]["brewery"]["brewery_id"]
    untappd_brewery_info = HTTP.get("https://api.untappd.com/v4/brewery/info/#{@untappd_brewery_id}?client_id=#{ENV["UNTAPPD_CLIENT_ID"]}&client_secret=#{ENV["UNTAPPD_CLIENT_SECRET"]}&q=#{@untappd_name}")
    @untappd_brewery_info = untappd_brewery_info.parse["response"]["brewery"]
    # @untappd_response = untappd_response.parse["data"][0]
    # beers_response = HTTP.get("https://api.brewerydb.com/v2/brewery/#{@brewery.breweryId}", :params => {key: ENV["BREWERY_DB_KEY_PRODUCTION"]})
    render 'show.json.jb'
  end
end

