class ExpensesController < ApplicationController
  before_action :set_user

  def index
    @groups = @author.groups
    @group = @groups.find(params[:group_id])
    @expenses = @group.expenses
  end

  def new
    @groups = @author.groups
    @group = @groups.find(params[:group_id])
    @expense = Expense.new
  end

  def create
    @group = Group.find(params[:group_id])
    @expense = @author.expenses.new(expense_params)

    return unless @expense.save

    @group_expenses = GroupExpense.new(group_id: @group.id, expense_id: @expense.id)
    return unless @group_expenses.save

    redirect_to group_expenses_path(@group)
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end

  def set_user
    @author = current_user
  end
end
