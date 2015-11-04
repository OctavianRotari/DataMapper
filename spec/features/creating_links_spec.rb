require 'web_helper'

feature 'saving the web site' do
  scenario 'adding the site adress and title' do
    helper
    click_button('Save')
    within "ul#links" do
      expect(page).to have_content('Hellokitty')
    end
  end
end
