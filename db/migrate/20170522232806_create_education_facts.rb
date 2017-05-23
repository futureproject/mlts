class CreateEducationFacts < ActiveRecord::Migration
  def change
    create_table :education_facts do |t|
      t.text :quote
      t.string :source
      t.string :link
      t.string :category
    end
  end
end
