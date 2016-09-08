class AddLatitudeAndLongitudeToScreenings < ActiveRecord::Migration
  def change
    add_column :screenings, :latitude, :float
    add_column :screenings, :longitude, :float
  end
end
