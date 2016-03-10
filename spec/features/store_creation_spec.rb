require "rails_helper"

RSpec.feature "Store creation", :type => :feature do
  scenario "I can see a form" do
    visit "/stores/new"
    expect(page).to have_text "Название магазина"
  end
end
