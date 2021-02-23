# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
  puts "creating a user"
  user = User.new(
    email: 'corey@gmail.com',
    password: '123456'
    )
    user.save!

  puts 'Creating some chairs....'
  10.times do
    chair = Chair.new(
      user: user,
      name:    Faker::Company.name,
      location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      price:  rand(0..75)
    )
    chair.save!
  end
puts 'Finished!'




