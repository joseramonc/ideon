class CreateFolds < ActiveRecord::Migration
  def change
    create_table :folds do |t|
      t.text :content
      t.references :note, index: true

      t.timestamps null: false
    end
    add_foreign_key :folds, :notes
  end
end
