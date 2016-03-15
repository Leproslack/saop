require "rails_helper"

  RSpec.feature "Poll creation", :type => :feature do
    scenario "I can see a form" do
      visit new_poll_path(@poll)
      expect(page).to have_selector("input[id='poll_name']")
      expect(page).to have_text "Представление"
      expect(page).to have_text "Мерчендайзинг"
      expect(page).to have_text "Знание"
      expect(page).to have_text "Чистота"
      expect(page).to have_text "Громкость"
      expect(page).to have_text "Внешний вид"
      expect(page).to have_text "Выкладка товара"
      expect(page).to have_text "Ассортимент"
      expect(page).to have_text "Уровень знаний ассортимента и характеристик товаров"
      expect(page).to have_xpath ('//select')
    end

    scenario "I can see created Poll on /show /index /edit" do
      visit new_poll_path(@poll)
      select '3', :from => 'poll[a11]'
      click_button 'Create poll'
      expect(page).to have_text 'Чистота: 3'
      click_link("Back")
      expect(page).to have_content(/Poll.+s/)
      click_link("Edit")
      expect(page).to have_selector("input[id='poll_name']")
      expect(page).to have_text "Представление"
      expect(page).to have_text "Мерчендайзинг"
      expect(page).to have_text "Знание"
      expect(page).to have_text "Чистота"
      expect(page).to have_text "Громкость"
      expect(page).to have_text "Внешний вид"
      expect(page).to have_text "Выкладка товара"
      expect(page).to have_text "Ассортимент"
      expect(page).to have_text "Уровень знаний ассортимента и характеристик товаров"
      expect(page).to have_xpath ('//select')

    end



  end
