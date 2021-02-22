require 'rails_helper'

RSpec.describe "Mechanic Index Page" do
  describe "As a User" do
    describe "When I visit the mechanics index page" do
      it "I see header saying 'All Mechanics'" do
        visit "/mechanics"

        expect(page).to have_content("All Mechanics")
      end
    end
  end
end