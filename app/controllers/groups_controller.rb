class GroupsController < ApplicationController
  before_action :admin_user, only: [:edit, :update, :destroy]

  def show
    @group = Group.find(params[:id])
  end

  def index
    @groups = Group.paginate(page: params[:page])
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

end
