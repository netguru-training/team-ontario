# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Seeds start'
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

parent = User.create!(email: 'parent@page.com',password: 'pass1234')

user.add_role "parent"

kid = User.create!(email: 'kid@page.com',password: 'pass1234')

user.add_role "kid"

puts 'Seeds stop'
