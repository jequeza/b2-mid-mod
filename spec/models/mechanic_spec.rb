require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before :each do
  Mechanic.destroy_all

   @john = Mechanic.create!(name: "John", years_experience: 21)
   @tom = Mechanic.create!(name: "Tom", years_experience: 6)
   @salomon = Mechanic.create!(name: "Salomon", years_experience: 18)
end
  describe "relationships" do
    it { should have_many :mechanic_rides }
    it { should have_many(:mechanics).through(:mechanic_rides)}
  end

  describe "class methods" do
    describe "::average_experience" do
      it "returns average years of experience for all mechanics" do
        @mechanics = Mechanic.all
        expect(@mechanics.average_experience).to eq(15)
      end
    end
  end
end