# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Deleting all categories'
Category.destroy_all
puts 'Categories deleted.'

puts 'Deleting all users'
User.destroy_all
puts 'Users deleted'

puts 'Creating new users DB'
20.times do
  user = User.new(
    email: Faker::Internet.unique.email,
    password: 'Test123',
    name: Faker::Name.unique.name,
    role: User::ROLE.sample
  )
  user.save!
  puts "#{user.name} created"
end
puts 'All users created.'

