class Api::SavedBreweriesController < ApplicationController
  def create
    saved_brewery = SavedBrewery.new(
      user_id: current_user.id,
      brewery_id: params[:brewery_id],
      visited: params[:visited],
      rating: params[:rating],
      comment: params[:comment],
      brewery_name: params[:brewery_name],
      venue_name: params[:venue_name]
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
