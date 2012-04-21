#encoding: UTF-8

require 'acceptance_helper'

feature "Project description" do

  scenario "Visitor should can see project short description", js: true do
    visit '/'
    page.should have_selector('#project-description')
    find('#project-description').should have_content 'Лепрооткрытки'
  end

  scenario "Visitor should can see project brief description" do
    visit '/'
    click_link 'Нет, расскажите мне подробнее'
    page.should have_content 'Что такое Лепрооткрытки?'
  end
end