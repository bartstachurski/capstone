class Api::FoursquareVenuesController < ApplicationController

  def index
    foursquare_breweries = HTTP.get("https://api.foursquare.com/v2/venues/explore?client_id=#{ENV["FOURSQUARE_CLIENT_ID"]}&client_secret=#{ENV["FOURSQUARE_CLIENT_SECRET"]}&ll=40.004834,-75.291034&v=20180323&categoryId=50327c8591d4c4b30a586d5d")
    @foursquare_breweries = foursquare_breweries.parse["response"]["groups"][0]["items"]
    @foursquare_breweries.each do |brewery|
      untappd_convert_id_response = HTTP.get("https://api.untappd.com/v4/venue/foursquare_lookup/#{brewery["venue"]["id"]}?client_id=#{ENV["UNTAPPD_CLIENT_ID"]}&client_secret=#{ENV["UNTAPPD_CLIENT_SECRET"]}")
      untappd_venue_id = untappd_convert_id_response.parse["response"]["venue"]["items"][0]["venue_id"]
      brewery["venue"]["untappd_venue_id"] = untappd_venue_id
    end
    # @foursquare_breweries.each do |brewery|
    # foursquare_venue_id = @foursquare_breweries[0]["venue"]["id"]
    # print foursquare_venue_id
    # print "this is the untappd id converted from the foursquare id"
    # print @untappd_convert_id
    # end
    render 'index.json.jb'
  end

  def show
    foursquare_venue_info = HTTP.get("https://api.foursquare.com/v2/venues/4fc99910bb3d84c733701efb?client_id=#{ENV["FOURSQUARE_CLIENT_ID"]}&client_secret=#{ENV["FOURSQUARE_CLIENT_SECRET"]}&v=20180323")
    @foursquare_venue_info = foursquare_venue_info.parse["response"]["venue"]
    render 'show.json.jb'
  end

end
