require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject do
    @user = User.create!(name: 'omar', email: 'omar@gmail.com', password: '934043')
    @expnse = Expense.create!(name: 'Expense 1', amount: 100, user_id: @user.id)
  end

  it 'should test the name attribute' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should test the amount attribute' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'should test the length of the name' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'should test the amount to be greater than 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end

  it 'should test the amount to be an integer' do
    subject.amount = 1.5
    expect(subject).to_not be_valid
  end
end
