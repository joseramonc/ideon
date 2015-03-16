class AddDeletedToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :deleted, :boolean
  end
end
