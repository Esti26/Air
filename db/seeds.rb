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
colors = ["multi-color", "white", "blue", "blonde", "brown", "blue", "purple", "gray", "pink", "green"]

images = [
  "https://images.unsplash.com/photo-1595888433198-fc3fba4d48e6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80.jpg",
  "https://images.unsplash.com/photo-1593880223042-744ce9a4b58f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
  "https://images.unsplash.com/photo-1559564071-dfa53d83b513?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80",
  "https://images.unsplash.com/photo-1579584707409-58eaaa0e9584?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80",
  "https://images.unsplash.com/photo-1643818622704-44d9ccd28c5c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=754&q=80",
  "https://images.unsplash.com/photo-1589738216835-c8de9d5fb452?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=326&q=80",
  "https://plus.unsplash.com/premium_photo-1684677942189-957a4b918979?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
  "https://images.unsplash.com/photo-1574773004910-1eeaabb62b55?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80",
  "https://plus.unsplash.com/premium_photo-1682096513300-cbcf7242aea2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
  "https://images.unsplash.com/photo-1602831013775-79d535589266?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"
]
10.times do |i|
  file = URI.open(images[i])
  wig = Wig.new(color: colors[i], length: Faker::Measurement.length, price: rand(10...42), title: Faker::Name.first_name, description: Faker::GreekPhilosophers.quote)
  wig.owner = User.all.sample
  wig.photo.attach(io: file, filename: "wig.png", content_type: "image/jpg")
  wig.save!
end

puts "Database Seeded!"
