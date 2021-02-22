require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before :each do
  Mechanic.destroy_all

   @john = Mechanic.create!(name: "John", years_experience: 21)
   @tom = Mechanic.create!(name: "Tom", years_experience: 6)
   @salomon = Mechanic.create!(name: "Salomon", years_experience: 18)
   @round_up = Ride.create!(name: "Round Up", thrill_rating: 8, open: true)
   @scrambler = Ride.create!(name: "Scrambler", thrill_rating: 9)
   @ferris_wheel =  Ride.create!(name: "Ferris Wheel", thrill_rating: 5, open: true)
   @bumper_cars = Ride.create!(name: "Bumper Cars", thrill_rating: 7, open: true)
   MechanicRide.create!(mechanic_id: @salomon.id, ride_id: @round_up.id)
   MechanicRide.create!(mechanic_id: @salomon.id, ride_id: @scrambler.id)
   MechanicRide.create!(mechanic_id: @salomon.id, ride_id: @ferris_wheel.id)
   MechanicRide.create!(mechanic_id: @salomon.id, ride_id: @bumper_cars.id)
end
  describe "relationships" do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  describe "class methods" do
    describe "::average_experience" do
      it "returns average years of experience for all mechanics" do
        @mechanics = Mechanic.all
        expect(@mechanics.average_experience).to eq(15)
      end
    end
  end
  describe "instance methods" do
    describe "#available_rides" do
      it "returns a collection of the rides ordered by most thrilling and that is open" do
        expect(@salomon.available_rides.length).to eq(3)
        expect(@salomon.available_rides.first).to eq(@round_up)
        expect(@salomon.available_rides.last).to eq(@ferris_wheel)
      end
    end
  end
end