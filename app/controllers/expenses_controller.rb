class ExpensesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = @groups.find(params[:group_id])
    @expenses = @group.expenses
  end

  def new
    @groups = current_user.groups
    @group = @groups.find(params[:group_id])
    @expense = Expense.new
  end

  def create
    @group = @groups.find(params[:group_id])
    @expense = Expense.new(expense_params)
    @expense.user = current_user
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
