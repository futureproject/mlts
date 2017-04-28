class AddIdentifierToScreenings < ActiveRecord::Migration
  def change
    add_column :screenings, :identifier, :string
  end
end
