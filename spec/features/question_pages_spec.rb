require 'rails_helper'

describe 'Adding a question' do
  it 'add a question under a user' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Login'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_button 'Login'
    click_on 'Add question'
    fill_in 'Title', with: 'Why?'
    fill_in 'Body', with: 'What does it sound like when doves cry?'
    click_button 'Create Question'
    expect(page).to have_content 'Question added!'
  end

end

describe 'associating response with question' do

  it 'assocates response with question and user' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, username: "foo@foo.com")
    question = FactoryGirl.create(:question)
    user.questions.push(question)
    response = FactoryGirl.create(:response, user: user2)
    question.responses.push(response)
    visit user_path(user)
    click_link 'WTF?'
    expect(page).to have_content 'Press the power button.'
  end

end
