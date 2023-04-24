require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(name: 'John Doe', email: 'john@doe.com', password: '123433') }

  before { subject.save }

  it "Should test the name attribute" do
    expect(subject.name).to eq('John Doe')
  end

  it "Should test the email attribute" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "Should test the password attribute" do
    expect(subject.password).to_not be_nil
  end
end
