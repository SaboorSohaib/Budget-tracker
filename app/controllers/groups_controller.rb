class GroupsController < ApplicationController
  before_action :set_user
  def index
    @groups = @user.groups
  end

  def show
    @group = Group.find(params[:id])
    @expenses = []
    @group.group_expenses.order(:id).each do |group_expense|
      @expenses << group_expense.expense
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = @user
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def set_user
    @user = current_user
  end
end
