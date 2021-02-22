require 'rails_helper'

RSpec.describe "Mechanic Index Page" do
  before :each do
  Mechanic.destroy_all

   @john = Mechanic.create!(name: "John", years_experience: 21)
   @tom = Mechanic.create!(name: "Tom", years_experience: 5)
   @salomon = Mechanic.create!(name: "Salomon", years_experience: 18)
end
  describe "As a User" do
    describe "When I visit the mechanics index page" do
      it "I see header saying 'All Mechanics'" do
        visit "/mechanics"

        expect(page).to have_content("All Mechanics")
      end

      it "I see list of all mechanics name and years of experience" do
        visit "/mechanics"

        within "#all-mechanics" do
          expect(page).to have_content(@salomon.name)
          expect(page).to have_content(@tom.name)
          expect(page).to have_content(@john.name)
          expect(page).to have_content(@salomon.years_experience)
          expect(page).to have_content(@tom.years_experience)
          expect(page).to have_content(@john.years_experience)
        end
      end
    end
  end
end