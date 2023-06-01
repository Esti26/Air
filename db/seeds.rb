# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Seeding Database!"
puts "Cleaning Database!"
Wig.delete_all
User.delete_all

10.times do
  User.create!(email: Faker::Internet.email, password: "123456")
end

images=["https://images.unsplash.com/photo-1595888433198-fc3fba4d48e6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80.jpg",
  "https://images.unsplash.com/photo-1608877607386-8698047d65a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
  "https://images.unsplash.com/photo-1633623163142-698bf3fe5062?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"]

10.times do |i|
  file = URI.open(images[i])
  wig = Wig.new(color: Faker::Color.color_name, length: Faker::Measurement.length, price: rand(10...42), title: Faker::Movies::HarryPotter.spell, description: Faker::GreekPhilosophers.quote)
  wig.owner = User.all.sample
  wig.photo.attach(io: file, filename: "wig.png", content_type: "image/jpg")
  wig.save!
end


puts "Database Seeded!"
