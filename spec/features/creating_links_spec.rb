feature "Adding links" do
  scenario "submitting a new link" do
    visit('/links/new')
    fill_in('add_title', with: 'Google')
    fill_in('add_url', with: 'http://www.google.com')
    click_button('Add Link')
    within('ul#links') do
      expect(page).to have_content('Google')
    end
  end
end
