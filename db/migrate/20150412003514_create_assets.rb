class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.attachment :file
      t.references :note, index: true

      t.timestamps null: false
    end
    add_foreign_key :assets, :notes
  end
end
