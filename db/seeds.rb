# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Quote.destroy_all

5.times do |user|
  User.create! email: Faker::Internet.email,
               name: Faker::Name.name,
               password: "password",
               password_confirmation: "password"
end

quotes = []

User.all.each do |user|
  3.times do
    quotes << user.quotes.build(body: Quoth.get)
  end
end

quotes.each(&:save)
