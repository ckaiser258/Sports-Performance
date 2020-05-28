# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
    Program.create(title: Faker::Sports::Football.position, description: Faker::Hipster.sentence, price: rand(40..200).to_s, coach_id: rand(1..10))
end

10.times do
    Athlete.create(name: Faker::Name.name, age: rand(18..30).to_s, email: "#{Faker::Name.first_name}@gmail.com", coach_id: rand(1..10), program_id: rand(1..10))
end

10.times do
    Coach.create(name: Faker::Name.name, bio: Faker::Hipster.paragraph, email: "#{Faker::Name.first_name}@gmail.com")
end
