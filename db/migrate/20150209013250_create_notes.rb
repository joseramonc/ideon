class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.boolean :favorite
      t.boolean :status

      t.timestamps null: false
    end
  end
end
