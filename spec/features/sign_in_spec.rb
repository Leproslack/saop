require 'rails_helper'
require 'spec_helper'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

feature "signing", :js => true do

  scenario 'user login' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Login', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'registration' do
    visit root_path
    click_link 'Registration'
    fill_in 'Email', with: "test@dev.dev"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'
    expect(page).to have_content "Hello, test@dev.dev"

  end

  scenario 'edit user' do
    login
    visit root_path
    click_on 'Account'
    fill_in 'Email', with: "test1@dev.dev"
    fill_in 'Current password', with: "password"
    click_button 'Update'
    expect(page).to have_content "Your account has been updated successfully."
    expect(page).to have_content "Hello, test1@dev.dev"

  end

  scenario 'delete user' do
    login
    visit root_path
    click_on 'Account'
    click_button 'Cancel my account'
    page.accept_alert
    expect(page).to have_content 'Bye! Your account has been successfully cancelled. We hope to see you again soon.'
  end

  scenario 'enter by email' do
    visit root_path
    click_link 'Registration'
    fill_in 'Email', with: "test@dev.dev"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'
    click_on 'Sign Out'
    page.accept_alert
    click_on 'Sign In'
    fill_in 'Login', with: "test@dev.dev"
    fill_in 'Password', with: "password"
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content "Hello, test@dev.dev"
  end

  scenario 'enter by username' do
    visit root_path
    click_link 'Registration'
    fill_in 'Email', with: "test@dev.dev"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'
    click_on 'Sign Out'
    page.accept_alert
    click_on 'Sign In'
    fill_in 'Login', with: "test"
    fill_in 'Password', with: "password"
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content "Hello, test@dev.dev"
  end


end



