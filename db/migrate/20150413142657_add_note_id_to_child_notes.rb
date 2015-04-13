class AddNoteIdToChildNotes < ActiveRecord::Migration
  def change
    add_column :child_notes, :note_id, :integer
  end
end
