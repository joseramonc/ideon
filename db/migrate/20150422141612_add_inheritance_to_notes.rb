class AddInheritanceToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :type, :string
    drop_table :child_notes
    add_column :notes, :parent_id, :integer
  end
end
