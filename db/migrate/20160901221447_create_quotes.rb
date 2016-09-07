class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :author
      t.text :quote_text
      t.string :link

      t.timestamps null: false
    end
  end
end
