class Api::UntappdBreweriesController < ApplicationController
  def show
    brewery = HTTP.get("https://api.untappd.com/v4/brewery/info/#{params[:id]}?client_id=#{ENV["UNTAPPD_CLIENT_ID"]}&client_secret=#{ENV["UNTAPPD_CLIENT_SECRET"]}")
    @brewery = brewery.parse["response"]["brewery"]
    render 'show.json.jb'
  end
end
