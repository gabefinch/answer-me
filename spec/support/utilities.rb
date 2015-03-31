def login(user)
  visit '/'
  click_on 'Login'
  fill_in 'Username', with: user.username
  fill_in 'Password', with: user.password
  click_button 'Login'
end
