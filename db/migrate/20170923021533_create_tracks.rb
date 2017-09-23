class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :position
      t.string :description
      t.string :video_embed
      t.string :video_title
      t.string :video_description
      t.string :take_action_title
      t.string :audio_embed
      t.string :audio_title
      t.string :audio_description
      t.text :take_action_text
      t.string :targeted_location
    end
  end
end
