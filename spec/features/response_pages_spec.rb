require 'rails_helper'

describe 'sending email on response' do
  it 'sends an email on response' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, username: "foo@foo.com")
    question = FactoryGirl.create(:question, user: user)
    login(user)
    visit question_path(question)
    click_on 'Leave a response'
    fill_in 'Body', with: 'foo'
    click_button 'Create Response'
    ActionMailer::Base.deliveries.last.to.should eq [user.username]
  end
end
