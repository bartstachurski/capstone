class Api::FoursquareVenuesController < ApplicationController

  def index
    foursquare_breweries = HTTP.get("https://api.foursquare.com/v2/venues/explore?client_id=#{ENV["FOURSQUARE_CLIENT_ID"]}&client_secret=#{ENV["FOURSQUARE_CLIENT_SECRET"]}&ll=40.004834,-75.291034&v=20180323&categoryId=50327c8591d4c4b30a586d5d")
    @foursquare_breweries = foursquare_breweries.parse["response"]["groups"][0]["items"]
    @foursquare_breweries.each do |brewery|
      foursquare_venue_id = brewery["venue"]["id"]
      untappd_convert_id = HTTP.get("https://api.untappd.com/v4/venue/foursquare_lookup/4fc99910bb3d84c733701efb?client_id=#{ENV["UNTAPPD_CLIENT_ID"]}&client_secret=#{ENV["UNTAPPD_CLIENT_SECRET"]}")
      @untappd_convert_id = untappd_convert_id.parse["response"]["venue"]
      # you were stuck here bc of an API limit
      print "This is the untappd venue id"
      print @untappd_convert_id
    end
    # render 'index.json.jb'
    render 'test.json.jb'
  end

  def show
    render 'show.json.jb'
  end
end
