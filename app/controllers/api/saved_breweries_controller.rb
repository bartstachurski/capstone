class Api::SavedBreweriesController < ApplicationController
  def create
    saved_brewery = SavedBrewery.new(
      user_id: current_user.id,
      untappd_brewery_id: params[:untappd_brewery_id],
      visited: params[:visited],
      rating: params[:rating],
      comment: params[:comment],
      brewery_name: params[:brewery_name],
      venue_name: params[:venue_name],
      foursquare_venue_id: params[:foursquare_venue_id],
      brewery_label: params[:brewery_label],
      untappd_venue_id: params[:untappd_venue_id]
      )
    saved_brewery.save
    render 'show.json.jb'
  end

  def update
    render 'show.json.jb'
  end

  def index
    @saved_breweries = current_user.saved_breweries
    render 'index.json.jb'
  end
end
