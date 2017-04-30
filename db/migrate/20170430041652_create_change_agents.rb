class CreateChangeAgents < ActiveRecord::Migration
  def change
    create_table :change_agents do |t|
      t.string :name
      t.string :title
      t.string :location
      t.string :quote

      t.timestamps null: false
    end
  end
end
