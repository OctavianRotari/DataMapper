def sign_in( name: 'Alice',
            email: 'alice@example.com',
            password: '12345678',
            confirmation_password: '12345678')
  visit '/'
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :confirmation_password, with: confirmation_password
  click_button 'sign in'
end
