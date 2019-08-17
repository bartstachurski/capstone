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
    # untappd_response = HTTP.get("https://api.untappd.com/v4/search/brewery/?client_id=#{ENV["UNTAPPD_CLIENT_ID"]}&client_secret=#{ENV["UNTAPPD_CLIENT_SECRET"]}&q=#{@brewery["brewery"]["name"]}")
    @untappd_name = URI.escape("Tired Hands Brewing Company")
    untappd_find_brewery = HTTP.get("https://api.untappd.com/v4/search/brewery?client_id=#{ENV["UNTAPPD_CLIENT_ID"]}&client_secret=#{ENV["UNTAPPD_CLIENT_SECRET"]}&q=#{@untappd_name}")
    @untappd_response = untappd_find_brewery.parse["response"]["brewery"]["items"][0]
    # @untappd_response = untappd_response.parse["data"][0]
    # beers_response = HTTP.get("https://api.brewerydb.com/v2/brewery/#{@brewery.breweryId}", :params => {key: ENV["BREWERY_DB_KEY_PRODUCTION"]})
    render 'show.json.jb'
  end
end

ENV["UNTAPPD_CLIENT_ID"]
ENV["UNTAPPD_CLIENT_SECRET"]