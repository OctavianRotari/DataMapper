def helper
  visit('/links/new')
  fill_in('title', with: 'Makersacademy')
  fill_in('url', with: 'http://www.makersacademy.com')
end
