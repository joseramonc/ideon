class CreateChecklistItems < ActiveRecord::Migration
  def change
    create_table :checklist_items do |t|
      t.string :description
      t.boolean :checked, default: false
      t.references :note, index: true

      t.timestamps null: false
    end
    add_foreign_key :checklist_items, :notes
  end
end
