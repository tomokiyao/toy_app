require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with afirst name, email" do
    user = User.new(
      name: 'yao',
      email: 'test@example.com',
      password: "foobar",
      password_confirmation: "foobar"
    )
    expect(user).to be_valid
  end

  it 'name should be valid' do
    user = User.new(
      name: nil,
      email: 'test@example.com'
    )
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'email should be valid' do
    user = User.new(
      name: 'yao',
      email: nil
    )
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'name should be maxlength 50' do
    user = User.new(
      name: 'a'*51,
      email: 'test@example.com',
      password: "foobar",
      password_confirmation: "foobar"
    )
    expect(user).to be_invalid
  end

  it 'email should be format' do
    user = User.new(
      name: 'test',
      email: 'testtest',
      password: "foobar",
      password_confirmation: "foobar"
    )
    expect(user).to be_invalid
  end

  it 'email should be unique' do
    User.create(
      name: 'test',
      email: 'test@example.com',
      password: "foobar",
      password_confirmation: "foobar"
    )

    user = User.new(
      name: 'test2',
      email: 'test@example.com',
      password: "foobar",
      password_confirmation: "foobar"
    )
    expect(user).to be_invalid
  end

end