require 'rails_helper'

describe 'sending email on response' do
  it 'sends an email on response' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, username: "foo@foo.com")
    question = FactoryGirl.create(:question)
    user.questions.push(question)
    visit '/'
    click_on 'Login'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_button 'Login'
    visit question_path(question)
    click_on 'Respond'
    fill_in 'Body', with: 'foo'
    click_button 'Create Response'
    ActionMailer::Base.deliveries.last.to.should eq [user.username]
  end
end
