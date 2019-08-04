class Api::SavedBreweriesController < ApplicationController
  def index
    response = HTTP.get("https://sandbox-api.brewerydb.com/v2/search/geo/point", :params => {key: ENV["BREWERY_DB_KEY"], lat: "39.966973", lng: "-75.143557"})
    # response = HTTP.get("https://sandbox-api.brewerydb.com/v2/search", :params => {key: ENV["BREWERY_DB_KEY"], q: "Dock Street"})
    @breweries = response.parse["data"][0]["brewery"]
    render 'index.json.jb'
  end
end
