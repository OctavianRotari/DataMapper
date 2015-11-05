def helper
  visit('/links/new')
  fill_in('title', with: 'Hellokitty')
  fill_in('url', with: 'http://www.hellokittylive.com/')
end
