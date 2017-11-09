# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"


questions = []
answers = []
users = []
comments = []
votes = []

10.times do
  questions << Question.create(title:(Faker::Simpsons.quote.chomp + "?") , description: Faker::MostInterestingManInTheWorld.quote )
end

20.times do
  answers << Answer.create(description: Faker::HowIMetYourMother.quote)
end

20.times do
  users << User.create(username: Faker::Name.first_name, email: Faker::Internet.safe_email, password: "hotdog")
end

User.create(username: "admin", email: "admin@admin.com", password: "admin")

20.times do
  comments << Comment.create(response: (Faker::Simpsons.quote) )
end

200.times do
  votes << Vote.create(shaka: 1, voteable_type: "Question")
end

30.times do
  votes << Vote.create(shaka: -1, voteable_type: "Question")
end


answers.each do |answer|
  questions.sample.answers << answer
  users.sample.answers << answer
end

comments.each do |comment|
  questions.sample.comments << comment
  users.sample.comments << comment
end

questions.each do |question|
  users.sample.questions << question
end

votes.each do |vote|
  users.sample.votes << vote
  questions.sample.votes << vote
end
