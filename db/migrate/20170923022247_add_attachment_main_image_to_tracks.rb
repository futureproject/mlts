class AddAttachmentMainImageToTracks < ActiveRecord::Migration
  def self.up
    change_table :tracks do |t|
      t.attachment :main_image
    end
  end

  def self.down
    remove_attachment :tracks, :main_image
  end
end
