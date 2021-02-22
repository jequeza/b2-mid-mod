# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Mechanic.destroy_all
Ride.destroy_all
MechanicRide.destroy_all

john = Mechanic.create!(name: "John", years_experience: 21)
tom = Mechanic.create!(name: "Tom", years_experience: 5)
salomon = Mechanic.create!(name: "Salomon", years_experience: 18)
round_up = Ride.create!(name: "Round Up", thrill_rating: 8, open: true)
scrambler = Ride.create!(name: "Scrambler", thrill_rating: 9, open: true)
ferris_wheel =  Ride.create!(name: "Ferris Wheel", thrill_rating: 5, open: true)
bumper_cars = Ride.create!(name: "Bumper Cars", thrill_rating: 8, open: true)

MechanicRide.create!(mechanic_id: salomon.id, ride_id: round_up.id)
MechanicRide.create!(mechanic_id: salomon.id, ride_id: scrambler.id)
MechanicRide.create!(mechanic_id: salomon.id, ride_id: ferris_wheel.id)
MechanicRide.create!(mechanic_id: salomon.id, ride_id: bumper_cars.id)

MechanicRide.create!(mechanic_id: tom.id, ride_id: bumper_cars.id)
MechanicRide.create!(mechanic_id: tom.id, ride_id: ferris_wheel.id)

MechanicRide.create!(mechanic_id: john.id, ride_id: round_up.id)
MechanicRide.create!(mechanic_id: john.id, ride_id: scrambler.id)
