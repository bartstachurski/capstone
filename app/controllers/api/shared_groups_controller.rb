class Api::SharedGroupsController < ApplicationController
  def index
    @shared_groups = current_user.shared_groups
    render 'index.json.jb'
  end

  def create
    @shared_group = SharedGroup.new(user_id: params[:user_id], group_id: params[:group_id])
    @shared_group.save
  end

end
