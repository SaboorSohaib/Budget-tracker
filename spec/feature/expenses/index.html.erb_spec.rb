require 'rails_helper'
module WardenTestHelpers
  include Warden::Test::Helpers
end

RSpec.describe 'expenses/index.html.erb', type: :feature do
  include WardenTestHelpers
  before(:each) do
    @user = User.create!(name: 'User', email: 'user1@gmail.com', password: '432323')
    @group = Group.create!(name: 'Group', icon: 'icon', user_id: @user.id)
    @expense = Expense.create!(name: 'Expense', amount: 100, user_id: @user.id)
    @expense = Expense.create!(name: 'Expense1', amount: 200, user_id: @user.id)
  end

  it 'should display page name' do
    login_as(@user, scope: :user)
    visit group_expenses_path(@group.id)
    expect(page).to have_content('Transactions')
  end

  it 'should display the icon' do
    login_as(@user, scope: :user)
    visit group_expenses_path(@group.id)
    expect(page).to have_content('Icon')
  end

  it 'displays the total amount of expenses' do
    login_as(@user, scope: :user)
    visit group_expenses_path(@group)
    total_amount = @group.expenses.sum(:amount)
    expect(page).to have_content("Total Amount: #{total_amount} $")
  end

  it 'displays the list of expenses' do
    login_as(@user, scope: :user)
    visit group_expenses_path(@group)

    @expenses = @group.expenses.order(created_at: :desc)
    @expenses.each do |expense|
      expect(page).to have_content("Transaction Name: #{expense.name}")
      expect(page).to have_content("Transaction Amount: #{expense.amount} $")
    end
  end

  it 'has a link to add a new transaction' do
    login_as(@user, scope: :user)
    visit group_expenses_path(@group)

    expect(page).to have_link('Add a New Transaction', href: new_group_expense_path(@group))
  end
end
