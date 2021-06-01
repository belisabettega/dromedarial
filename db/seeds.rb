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
10.times do
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

puts 'Creating categories DB'

category_birthday = Category.new(
  title: 'Birthday',
  price: 50.00,
  user_id: User.ids.sample
)
category_birthday.save!
puts 'Birthday category created.'

category_wedding = Category.new(
  title: 'Wedding',
  price: 100.00,
  user_id: User.ids.sample
)
category_wedding.save!
puts 'Wedding category created.'

