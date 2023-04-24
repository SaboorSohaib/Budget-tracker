require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do 
    @user = User.create!(name: 'abid', email: 'abid@gmail.com', password: '123443')
    Group.create!(name: 'Group 1', icon: 'icon', user_id: @user.id)
  end

  before { subject.save }

  it "Should test the name attribute" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "Should test the icon attribute" do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it "Should test the length of the name" do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end
end
