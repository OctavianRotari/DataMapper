

feature 'saving the web site' do
  scenario 'adding the site adress and title' do
    visit('/links/new')
    fill_in('title', with: 'Makersacademy')
    fill_in('url', with: 'http://www.makersacademy.com')
    click_button('Save')
    within "ul#links" do
      expect(page).to have_content('Makersacademy')
    end
  end
end
