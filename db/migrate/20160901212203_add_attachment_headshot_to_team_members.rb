class AddAttachmentHeadshotToTeamMembers < ActiveRecord::Migration
  def self.up
    change_table :team_members do |t|
      t.attachment :headshot
    end
  end

  def self.down
    remove_attachment :team_members, :headshot
  end
end
