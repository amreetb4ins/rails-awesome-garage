# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts "Cleaning up database..."
Favourite.destroy_all
Car.destroy_all
Owner.destroy_all
puts "Database cleaned"

puts "Creating owners..."

5.times do
  owner = Owner.create(
    nickname: Faker::FunnyName.two_word_name,
  )
end

owners = Owner.all


puts "Creating cars.."

images = [ "car1.jpg", "car2.jpg", "car3.jpg", "car4.jpg", "car5.jpg" ]

images.each do |image|
  image_url = images
end

random_images = images.shuffle
5.times do |i|
  car = Car.create(
    model: Faker::Vehicle.model,
    brand: Faker::Vehicle.make,
    year: Faker::Vehicle.year,
    fuel: Faker::Vehicle.fuel_type,
    owner: owners.sample,
    image_url: random_images[i]
  )

  puts "#{car.brand} #{car.model} #{car.year} owned by #{car.owner.nickname} has been created with image #{car.image_url}"
end
