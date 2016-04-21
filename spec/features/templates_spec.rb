require 'rails_helper'

feature "Template", :js => true do

  scenario 'I can create/edit/destroy template' do
    visit new_template_path
    fill_in "Category", with: "Test Category"
    click_link "Add Question"
    fill_in "placeholder", with: "Test question"
    select('1', :from => 'select')
    click_button 'Save'
    expect(page).to have_content 'Template was successfully created.'
    click_link "Edit"
    select('2', :from => 'select')
    fill_in "placeholder", with: "Test question2"
    click_button 'Save'
    expect(page).to have_content 'Template was successfully updated.'
    click_link "Back"
    click_link 'Destroy', match: :first
    page.accept_alert
    expect(page).to have_content 'Template was successfully destroyed.'
  end

end
