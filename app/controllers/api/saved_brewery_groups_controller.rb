class Api::SavedBreweryGroupsController < ApplicationController

  def create
    @saved_brewery_group = SavedBreweryGroup.new(saved_brewery_id: params[:saved_brewery_id], 
      group_id: params[:group_id])
    @saved_brewery_group.save
    render 'show.json.jb'
  end

  def index
    @saved_brewery_groups = SavedBreweryGroup.find_by(group_id: 2, saved_brewery_id: 29)
    render 'index.json.jb'
  end

  def show
    @saved_brewery_group = SavedBreweryGroup.find_by
    render 'show.json.jb'
  end

  def destroy
    @saved_brewery_group = SavedBreweryGroup.find_by(group_id: params[:group_id], saved_brewery_id: params[:saved_brewery_id])
    @saved_brewery_group.destroy
    render 'destroy.json.jb'
  end

end
