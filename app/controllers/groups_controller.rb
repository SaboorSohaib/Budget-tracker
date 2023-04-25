class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
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
    @group.author = current_user
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
