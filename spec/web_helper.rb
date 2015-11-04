def helper
  visit('/links/new')
  fill_in('Title', with: 'Hellokitty')
  fill_in('url', with: 'http://www.hellokittylive.com/')
end
