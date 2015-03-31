require 'rails_helper'

describe 'adding a user' do
  it 'adds a new user' do
    visit new_user_path
    fill_in 'Username', with: 'gabe@finchler.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create User'
    expect(page).to have_content 'You successfully registered!'
  end
  it 'rejects passwords less than 8 chars' do
    visit new_user_path
    fill_in 'Username', with: 'gabe@finchler.com'
    fill_in 'Password', with: 'dog'
    fill_in 'Password confirmation', with: 'dog'
    click_on 'Create User'
    expect(page).to have_content 'Errors in your submission. Try again.'
  end
end

describe 'login' do
  it 'logs user in' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'login-button'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_button 'Login'
    expect(page).to have_content 'You are logged in!'
  end
end

describe 'user view' do
  it 'displays user view' do
    user = FactoryGirl.create(:user)
    login(user)
    visit '/users/'
    click_link "user-link-#{user.id}"
    expect(page).to have_content user.username
  end

end
