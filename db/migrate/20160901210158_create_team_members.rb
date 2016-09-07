class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|

      t.string :name
      t.string :business_title
      t.text :bio
      t.timestamps null: false
    end
  end
end
