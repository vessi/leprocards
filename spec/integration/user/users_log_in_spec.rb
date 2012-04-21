#encoding: UTF-8

require 'acceptance_helper'

feature 'User logs in' do
  background do
    @user = FactoryGirl.create :user, name: 'User'
  end

  scenario 'Visitor should log in via sidebar' do
    visit '/'
    page.should have_selector('#sidebar')

    within '#sidebar' do
      fill_in 'name', with: 'User'
      fill_in 'password', with: 'pass123'
      click_button 'Войти'
    end

    page.should have_content "Добро пожаловать, #{@user.name}"
  end

  scenario 'Visitor should log in via separate login page' do
    visit '/login'
    within '.container .span9' do
      fill_in 'Name', with: 'User'
      fill_in 'Password', with: 'pass123'
      click_button 'Log in'
    end

    page.should have_content "Добро пожаловать, #{@user.name}"
  end
end