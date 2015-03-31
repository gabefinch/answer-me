# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([
  {username: 'guest@answer.me', password: 'password'},
  {username: 'mike@mike.com', password: 'password'},
  {username: 'gabe@gabe.com', password: 'password'},
  {username: 'lizzie@lizzie.com', password: 'password'},
  {username: 'tina@tina.com', password: 'password'}
  ])
User.all.each do |user|
  user.questions = Question.create([
    {title: 'AJAX', body: 'What does AJAX stand for?'},
    {title: 'ERB', body: 'What does ERB stand for?'},
    {title: 'SJR', body: 'What does SJR stand for?'},
    {title: 'HTML', body: 'What does HTML stand for?'},
    {title: 'CSS', body: 'What does CSS stand for?'},
    ])
end
Question.all.each do |question|
  question.responses = Response.create([
    {body: 'I was wondering the same thing?', user_id: User.all[0].id },
    {body: 'I can not believe you do not know this', user_id: User.all[1].id},
    {body: 'Why would you ask that?', user_id: User.all[2].id},
    {body: 'foobar', user_id: User.all[3].id}

    ])
end
