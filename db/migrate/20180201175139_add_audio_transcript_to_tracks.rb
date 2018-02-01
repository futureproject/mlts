class AddAudioTranscriptToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :audio_transcript, :text
  end
end
