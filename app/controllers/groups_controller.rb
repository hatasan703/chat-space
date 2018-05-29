class GroupsController < ApplicationController
  before_action :set_group, only: %i(edit update)

  def index
    @current_user_groups = GroupDecorator.decorate_collection(current_user.groups)
  end

  def new
    @users = User.all
    @group = Group.new
  end

  def create
    @users = User.all
    @group = Group.new(group_params).decorate
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @users = User.all
  end

  def update
    @users = User.all
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: "グループを編集しました"
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
