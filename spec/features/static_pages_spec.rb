require 'rails_helper'

feature 'static_pages', type: :feature do

  it 'home title' do
    visit static_pages_home_path
    expect(page).to have_title('HOME|Ruby on Rails Tutorial')
  end

  it 'help title' do
    visit static_pages_help_path
    expect(page).to have_title('HELP|Ruby on Rails Tutorial')
  end

  it 'about title' do
    visit static_pages_about_path
    expect(page).to have_title('ABOUT|Ruby on Rails Tutorial')
  end

  it 'contact title' do
    visit static_pages_contact_path
    expect(page).to have_title('CONTACT|Ruby on Rails Tutorial')
  end

end