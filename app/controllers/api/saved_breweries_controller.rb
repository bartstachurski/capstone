class Api::SavedBreweriesController < ApplicationController
  def create
    saved_brewery = SavedBrewery.new(
      user_id: current_user.id,
      brewery_id: params[:brewery_id],
      visited: params[:visited],
      rating: params[:rating],
      comment: params[:comment]
      )
    saved_brewery.save
    render 'show.json.jb'
  end
end
