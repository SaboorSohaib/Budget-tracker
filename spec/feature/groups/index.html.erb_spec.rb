require 'rails_helper'

RSpec.describe 'groups/index.html.erb', type: :feature do
  before(:each) do
    @user = User.create!(name: 'User', email: 'user@gmail.com', password: '2132424')
    @group = Group.create!(name: 'Group', icon: 'icon', user_id: @user.id)
  end

  it 'should authenticate the user' do
    visit new_user_session_path
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: '2132424'
    click_button 'Log in'

    visit groups_path
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@group.name)
    expect(page).to have_content(@group.expenses.sum(:amount))
    expect(page).to have_content(@group.created_at.strftime('%d %b %Y'))
    expect(page).to have_content('Add a New Category')
  end
end
