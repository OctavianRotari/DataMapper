require 'web_helper'

feature 'user signs up' do
  scenario 'user can sign up' do
    sign_in
    expect(page.status_code).to eq(200)
    expect { sign_in }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, Alice")
    expect(User.first.email).to eq('alice@example.com')
  end

end
