require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(name: 'ali', email: 'ali@gmail.com', password: '123433') }

  before { subject.save }

  it 'Should test the name attribute' do
    expect(subject.name).to eq('ali')
  end

  it 'Should test the email attribute' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'Should test the password attribute' do
    expect(subject.password).to_not be_nil
  end

  it 'Should test the length of the name' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end
end
