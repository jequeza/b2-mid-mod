require 'rails_helper'

RSpec.describe "Mechanic Show Page" do
  before :each do
    Mechanic.destroy_all
    Ride.destroy_all
    MechanicRide.destroy_all

   @salomon = Mechanic.create!(name: "Salomon", years_experience: 18)
   @round_up = Ride.create!(name: "Round Up", thrill_rating: 8, open: true)
   @scrambler = Ride.create!(name: "Scrambler", thrill_rating: 9)
   @ferris_wheel =  Ride.create!(name: "Ferris Wheel", thrill_rating: 5, open: true)
   @bumper_cars = Ride.create!(name: "Bumper Cars", thrill_rating: 8, open: true)
   MechanicRide.create!(mechanic_id: @salomon.id, ride_id: @round_up.id)
   MechanicRide.create!(mechanic_id: @salomon.id, ride_id: @scrambler.id)
   MechanicRide.create!(mechanic_id: @salomon.id, ride_id: @ferris_wheel.id)
   MechanicRide.create!(mechanic_id: @salomon.id, ride_id: @bumper_cars.id)
end
  describe "When I visit a mechanic show page" do
    it "I see their name, years of experience, and the names of all rides they're working on" do
      visit "/mechanics/#{@salomon.id}"

      within "#mechanic-info" do
        expect(page).to have_content(@salomon.name)
        expect(page).to have_content(@salomon.years_experience)
        expect(page).to have_content(@round_up.name)
        expect(page).to have_content(@ferris_wheel.name)
        expect(page).to have_content(@bumper_cars.name)
      end
    end
    it "I only see rides taht are open" do
      visit "/mechanics/#{@salomon.id}"

      within "#mechanic-info" do
        expect(page).to_not have_content(@scrambler.name)
      end
    end
  end

  describe "I see a form to add a ride to mechanic workload" do
    it "it can add a ride by filling out a form with an id of existing ride" do

      visit "/mechanics/#{@salomon.id}"
      roller_coaster = Ride.create!(name: "Roller Coaster", thrill_rating: 10, open: true)
      within "#mechanic-info" do
        fill_in "ride_id", with: roller_coaster.id
        click_on 'Submit'

        expect(current_path).to eq("/mechanics/#{@salomon.id}")
        expect(page).to have_content(roller_coaster.name)
      end
    end
  end
end