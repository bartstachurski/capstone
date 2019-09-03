class Api::UntappdVenuesController < ApplicationController
  def index
    venues = HTTP.get("https://api.untappd.com/v4/search/venue?client_id=#{ENV["UNTAPPD_CLIENT_ID"]}&client_secret=#{ENV["UNTAPPD_CLIENT_SECRET"]}&q=#{params[:city]}")
    @venues = venues.parse["response"]["venues"]["items"]
    render 'index.json.jb'
  end

  def show
    untappd_venue_info = HTTP.get("https://api.untappd.com/v4/venue/info/#{params[:id]}?client_id=#{ENV["UNTAPPD_CLIENT_ID"]}&client_secret=#{ENV["UNTAPPD_CLIENT_SECRET"]}")
    @untappd_venue_info = untappd_venue_info.parse["response"]["venue"]
    @sorted_brewery_locations = @untappd_venue_info["brewery_locations"]["items"].sort_by{ |brewery| brewery["brewery_id"]}
    if @sorted_brewery_locations == []
      @brewery_id = @untappd_venue_info["media"]["items"][0]["brewery"]["brewery_id"]
      @brewery_name = @untappd_venue_info["media"]["items"][0]["brewery"]["brewery_name"]
    else
      @brewery_id = @sorted_brewery_locations[0]["brewery_id"]
      @brewery_name = @sorted_brewery_locations[0]["brewery_name"]
    end
    render 'show.json.jb'
  end
end


# ENV["UNTAPPD_CLIENT_ID"]
# ENV["UNTAPPD_CLIENT_SECRET"]