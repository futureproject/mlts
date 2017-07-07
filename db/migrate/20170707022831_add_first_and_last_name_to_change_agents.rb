class AddFirstAndLastNameToChangeAgents < ActiveRecord::Migration
  def change
    add_column :change_agents, :first_name, :string
    add_column :change_agents, :last_name, :string
  end
end
