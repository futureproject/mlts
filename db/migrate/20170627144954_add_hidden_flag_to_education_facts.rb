class AddHiddenFlagToEducationFacts < ActiveRecord::Migration
  def change
    add_column :education_facts, :hidden, :boolean, default: false
  end
end
