# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AthleteSport.destroy_all
CoachSport.destroy_all
Athlete.destroy_all
Program.destroy_all
Coach.destroy_all
Sport.destroy_all

Sport.create!(name: "Football")
Sport.create!(name: "Basketball")
Sport.create!(name: "Soccer")
Sport.create!(name: "Rugby")
Sport.create!(name: "Tennis")
Sport.create!(name: "Martial Arts")
Sport.create!(name: "Other")

10.times do
    Coach.create!(name: Faker::Name.name, bio: Faker::Hipster.paragraph, email: "#{Faker::Name.first_name}@gmail.com", password: "hello")
end

10.times do
    Program.create!(title: Faker::Sports::Football.position, description: Faker::Hipster.sentence, price: rand(40..200).to_s, coach_id: Coach.all.sample.id)
end

10.times do
    Athlete.create!(name: Faker::Name.name, age: rand(18..30).to_s, email: "#{Faker::Name.first_name}@gmail.com", coach_id: Coach.all.sample.id, program_id: Program.all.sample.id, password: "hello")
end