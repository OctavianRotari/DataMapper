require 'web_helper'

feature 'user registers' do
  scenario "the confirmation password isn't equal to the password" do
    sign_in
    expect { sign_in(confirmation_password: 'wrong' ) }.not_to change(User, :count)
    expect(page).to have_content("Confirmation password and password are different")
  end
end
