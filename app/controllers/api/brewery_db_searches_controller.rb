class Api::BreweryDbSearchesController < ApplicationController

  def index
    response = HTTP.get("https://sandbox-api.brewerydb.com/v2/search/geo/point", :params => {key: ENV["BREWERY_DB_KEY"], lat: params[:lat], lng: params[:lng]})
    @breweries = response.parse["data"][0]["brewery"]
    render 'index.json.jb'
  end
end
