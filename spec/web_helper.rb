def sign_in
  visit ('/')
  fill_in 'name', with: 'Octavian'
  fill_in 'email', with: 'octavian@.com'
  fill_in 'password', with: '1234'
  click_button('sign in')
end
