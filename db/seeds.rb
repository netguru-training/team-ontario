# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Seeds start'
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

2.times do
  Family.create!(
    name: Faker::Name.last_name,
    )
end

parent = User.create!(email: 'parent@page.com',password: 'pass1234', family_id: 1)
parent1 = User.create!(email: 'parent1@page.com',password: 'pass1234', family_id: 2)
kid = User.create!(email: 'kid@page.com',password: 'pass1234', family_id: 1)
kid1 = User.create!(email: 'kid1@page.com',password: 'pass1234', family_id: 2)

parent.add_role "parent"
kid.add_role "kid"
parent1.add_role "parent"
kid1.add_role "kid"


EventsType.create!( name: "typ")

(1..30).each do |i|
  Event.create!(name: Faker::Lorem.word,
    description: Faker::Lorem.sentence, points: rand(-100..100),
    family_id: rand(1..2), events_type_id: 1)
  KidEvent.create!(user_id: rand(1..4), event_id: i )
end
30.times do
  Comment.create!(content: Faker::Lorem.sentence, user_id: rand(1..4))
end


puts 'Seeds stop'
