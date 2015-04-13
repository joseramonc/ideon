class CreateChildNotes < ActiveRecord::Migration
  def change
    create_table :child_notes do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
