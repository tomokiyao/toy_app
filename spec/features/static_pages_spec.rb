require 'rails_helper'

feature 'static_pages', type: :feature do

  it 'home title' do
    visit home_path
    expect(page).to have_title('HOME|Ruby on Rails Tutorial')
  end

  it 'help title' do
    visit help_path
    expect(page).to have_title('HELP|Ruby on Rails Tutorial')
  end

  it 'about title' do
    visit about_path
    expect(page).to have_title('ABOUT|Ruby on Rails Tutorial')
  end

  it 'contact title' do
    visit contact_path
    expect(page).to have_title('CONTACT|Ruby on Rails Tutorial')
  end

end