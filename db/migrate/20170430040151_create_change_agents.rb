class CreateChangeAgents < ActiveRecord::Migration
  def change
    create_table :change_agents do |t|
      t.string :name
      t.string :title
      t.string :bio
      t.string :link
    end
  end
end
