require 'rails_helper'
require 'spec_helper'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

feature "signing", :js => true do
  user = FactoryGirl.create(:user)
  scenario 'user login' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Login', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end



