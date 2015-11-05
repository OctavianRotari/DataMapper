require 'web_helper'

feature 'saving the web site' do
  scenario 'adding the site adress and title' do
    helper
    fill_in('tag', with: 'coding')
    click_button('Save')
    link = Link.first
    expect(link.tags.map(&:name)).to include('coding')
  end
end
