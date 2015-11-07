feature 'adding multiple tags' do
  scenario 'ads multiple tags to the same link' do
    visit('/links/new')
    fill_in('title', with: 'Makersacademy')
    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('tag', with: 'coding education')
    click_button('Save')
    link = Link.first
    expect(link.tags.map(&:name)).to include('coding', 'education')
  end
end
