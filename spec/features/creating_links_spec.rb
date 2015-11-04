feature 'saving the web site' do
  scenario 'adding the site adress and title' do
    visit('/links/new')
    fill_in('Title', with: 'Hellokitty')
    fill_in('url', with: 'http://www.hellokittylive.com/')
    click_button('Save')
    within "ul#links" do
      expect(page).to have_content('Hellokitty')
    end
  end
end
