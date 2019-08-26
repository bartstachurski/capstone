class Api::FoursquareVenuesController < ApplicationController

  def index
    foursquare_breweries = HTTP.get("https://api.foursquare.com/v2/venues/explore?client_id=#{ENV["FOURSQUARE_CLIENT_ID"]}&client_secret=#{ENV["FOURSQUARE_CLIENT_SECRET"]}&ll=40.004834,-75.291034&v=20180323&categoryId=50327c8591d4c4b30a586d5d")
    @foursquare_breweries = foursquare_breweries.parse["response"]["groups"][0]["items"]
    render 'index.json.jb'
  end

  def show
    render 'show.json.jb'
  end
end
