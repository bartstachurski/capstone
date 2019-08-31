class Api::SavedBreweryGroupsController < ApplicationController

  def create
    @saved_brewery_group = SavedBreweryGroup.new(saved_brewery_id: params[:saved_brewery_id], 
      group_id: params[:group_id])
    @saved_brewery_group.save
  end

  def show
    render 'show.json.jb'
  end

  def destroy
    @saved_brewery_group = SavedBreweryGroup.find_by(id: params[:id])
    @saved_brewery_group.destroy
    render 'destroy.json.jb'
  end

end
