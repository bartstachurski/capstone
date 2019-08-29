class Api::GroupsController < ApplicationController

  def index
    @groups = current_user.groups
    render 'index.json.jb'
  end

  def show
    @group = Group.find_by(id: 2)
    @breweries = @group.saved_breweries
    render 'show.json.jb'
  end

  def create
    render 'show.json.jb'
  end

  def destroy
    render 'destroy.json.jb'
  end

  def update
    render 'show.json.jb'
  end

end
