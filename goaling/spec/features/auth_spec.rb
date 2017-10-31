require 'spec_helper'
require 'rails_helper'

RSpec.feature "Auth", type: :feature do

  feature 'the signup process' do
    scenario 'has a new user page' do
      visit new_user_url
      expect(page).to have_content "New User"
    end
  end

    feature 'signing up a user' do
      before(:each) do
        visit new_user_url
        fill_in 'Username', :with => "goaler"
        fill_in 'Password', :with => "test123"
        click_on 'Create User'
      end
      scenario 'shows username on the homepage after signup' do
        expect(page).to have_content "goaler"
        expect(current_path).to eq("/users")
      end
    end


  feature 'logging in' do
    before(:each) do
      visit new_session_url
      fill_in 'Username', :with => "goaler"
      fill_in 'Password', :with => "test123"
      click_on 'Sign In'
    end
    scenario 'shows username on the homepage after login' do
      expect(page).to have_content "goaler"
      expect(current_path).to eq("/users")
    end
  end

  feature 'logging out' do
    before(:each) do
      visit new_session_url
      fill_in 'Username', :with => "goaler"
      fill_in 'Password', :with => "test123"
      click_on 'Sign In'
      click_button('Sign Out')
    end

    scenario 'begins with a logged out state' do
      expect(page).to have_content "Log In"
    end

    scenario 'doesn\'t show username on the homepage after logout' do
      expect(page).not_to have_content "goaler"
      expect(current_path).to eq("/users")
    end
  end
end
