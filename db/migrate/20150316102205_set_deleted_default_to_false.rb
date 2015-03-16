class SetDeletedDefaultToFalse < ActiveRecord::Migration
  def change
  	change_column :notes, :deleted, :boolean, :default => false
  end
end
