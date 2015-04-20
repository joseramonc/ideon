class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :note, index: true
      t.integer :linked_note_id

      t.timestamps null: false
    end
    add_foreign_key :links, :notes
  end
end
