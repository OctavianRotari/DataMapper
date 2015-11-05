require 'web_helper'

feature 'visit page with indicated tag' do
  scenario 'displays all links with kittens tag' do
    helper
    fill_in('Tag', with: 'kittens')

    click_button('Save')
    visit '/links/tag/kittens'
    expect(page).to have_content('http://www.hellokittylive.com/')
  end
end
