class AddAttachmentActImageToTracks < ActiveRecord::Migration
  def self.up
    change_table :tracks do |t|
      t.attachment :act_image
    end
  end

  def self.down
    remove_attachment :tracks, :act_image
  end
end
