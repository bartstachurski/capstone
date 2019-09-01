class Api::GroupsController < ApplicationController

  def index
    @groups = current_user.groups
    render 'index.json.jb'
  end

  def show
    @group = Group.find_by(id: params[:id])
    @breweries = @group.saved_breweries
    @saved_brewery_groups = @group.saved_brewery_groups
    render 'show.json.jb'
  end

  def create
    @group = Group.new(name: params[:name], user_id: current_user.id)
    @group.save
    render 'show.json.jb'
  end

  def destroy
    render 'destroy.json.jb'
  end

  def update
    render 'show.json.jb'
  end

end
