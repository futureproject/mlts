class AddLinkToChangeAgents < ActiveRecord::Migration
  def change
    add_column :change_agents, :link, :string
  end
end
