feature "Viewing links" do
  scenario "I can see existing links on the links page" do
    visit('/')
    # fill_in('add_title', with: 'Makers')
    # fill_in('add_url', with: 'http://www.makersacademy.com')
    # click_button('add_link')
    Link.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
    within('ul#links') do
      expect(page).to have_content('Makers Academy')
    end
  end
end
