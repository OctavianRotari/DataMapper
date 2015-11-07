feature 'saving the web site' do
  scenario 'adding the site adress and title' do
    visit('/links/new')
    fill_in('title', with: 'Makersacademy')
    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('tag', with: 'coding')
    click_button('Save')
    link = Link.first
    expect(link.tags.map(&:name)).to include('coding')
  end
end
