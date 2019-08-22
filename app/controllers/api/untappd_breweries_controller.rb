class Api::UntappdBreweriesController < ApplicationController
  def show
    brewery = HTTP.get("https://api.untappd.com/v4/brewery/info/#{params[:id]}?client_id=#{ENV["UNTAPPD_CLIENT_ID"]}&client_secret=#{ENV["UNTAPPD_CLIENT_SECRET"]}")
    @brewery = brewery.parse["response"]["brewery"]
    # @sorted_brewery_locations = @untappd_brewery_info["brewery_locations"]["items"].sort_by{ |brewery| brewery["brewery_id"]}
    render 'show.json.jb'
  end
end
