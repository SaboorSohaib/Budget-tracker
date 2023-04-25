class ExpensesController < ApplicationController
  before_action :set_user
  def index
    @groups = @user.groups
    @group = @groups.find(params[:group_id])
    @expenses = @group.expenses
  end

  def new
    @groups = @user.groups
    @group = @groups.find(params[:group_id])
    @expense = Expense.new
  end

  def create
    @group = @groups.find(params[:group_id])
    @expense = Expense.new(expense_params)
    @expense.author = @user
    if @expense.save
      GroupExpense.create(group: @group, expense: @expense)
      redirect_to group_expenses_path(@group)
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end

private

def set_user
  @user = current_user
end
