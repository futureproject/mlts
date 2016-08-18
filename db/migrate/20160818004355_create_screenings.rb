class CreateScreenings < ActiveRecord::Migration
  def change
    create_table :screenings do |t|
      t.datetime :screening_time
      t.string :city
      t.string :country
      t.string :link
      t.string :venue_name
      t.string :street_address

      t.timestamps null: false
    end
  end
end
