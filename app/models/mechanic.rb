class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.average_experience
    average(:years_experience)
  end
end