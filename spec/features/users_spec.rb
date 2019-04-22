require 'rails_helper'

RSpec.feature 'Users', type: :feature do

  let(:user) {User.new(name: "test",email: "test@example.org", password: "password", password_confirmation: "password")}

  scenario 'Signup page path' do
    visit root_path
    click_on 'Sign up'

    expect(page).to have_content('Sign up')
  end

  scenario 'user sign up' do
    visit signup_path

    expect {
      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Confirmation', with: user.password_confirmation
      click_button 'Create my account'
    }.to change(User, :count).to(1)

    expect(page).to have_content('Welcome to the Sample App!')
  end

  scenario 'correct error messages' do
    visit signup_path

    fill_in 'Name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Confirmation', with: ''
    click_button 'Create my account'

    expect(page).to have_content("can't be blank")
  end
end