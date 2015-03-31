require 'rails_helper'

describe 'Adding a question' do
  it 'add a question under a user' do
    user = FactoryGirl.create(:user)
    login(user)
    click_on 'Add question'
    fill_in 'Title', with: 'Why?'
    fill_in 'Body', with: 'What does it sound like when doves cry?'
    click_button 'Create Question'
    expect(page).to have_content 'Question added!'
  end

  it 'add a question using ajax' do
    visit root_path

  end

end

describe 'associating response with question' do

  it 'assocates response with question and user' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, username: "foo@foo.com")
    question = FactoryGirl.create(:question, user: user)
    response = FactoryGirl.create(:response, question: question, user: user2)
    visit user_path(user)
    click_link question.title
    expect(page).to have_content response.body
  end

end
