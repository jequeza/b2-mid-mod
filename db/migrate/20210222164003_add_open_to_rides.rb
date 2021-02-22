class AddOpenToRides < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :open, :boolean, default: false
  end
end
