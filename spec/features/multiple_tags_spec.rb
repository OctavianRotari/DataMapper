feature 'adding multiple tags' do

  before (:each) do
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'gum')])
  end

  scenario 'allows to see the link when visiting bubbles tag' do
      visit '/links/tags/bubbles'
      expect(page.status_code).to eq(200)
      within 'ul#links' do
        expect(page).to have_content('Bubble Bobble')
      end
  end

  scenario 'allows to see the link when visiting gum tag' do
      visit '/links/tags/gum'
      expect(page.status_code).to eq(200)
      within 'ul#links' do
        expect(page).to have_content('http://www.bubble-bobble.com')
      end
  end
end
