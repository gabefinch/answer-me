require 'rails_helper'

describe 'Adding a question' do
  it 'adds a question under a user' do
    user = FactoryGirl.create(:user)
    login(user)
    visit user_path(user)
    click_on 'Add question'
    fill_in 'Title', with: 'Why?'
    fill_in 'Body', with: 'What does it sound like when doves cry?'
    click_button 'Create Question'
    expect(page).to have_content 'Question added!'
  end

  it 'adds a question using ajax', js:true do
    user = FactoryGirl.create(:user)
    login(user)
    visit user_path(user)
    click_on 'Add question'
    fill_in 'Title', with: 'Why?'
    fill_in 'Body', with: 'What does it sound like when doves cry?'
    click_button 'question_create_btn'

    expect(page).to have_content 'Why?'
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
describe 'the deleting a question process' do

  it 'deletes a question', js: true do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, user: user)
    visit question_path(question)
    save_screenshot('~/Desktop/file.png')
    page.find("#delete_question_#{question.id}").trigger('click')
    expect(page).to_not have_content question.title
  end

end
