class SetParentIdDefaultToZero < ActiveRecord::Migration
  def change
    change_column :notes, :parent_id, :int, {default: 0}
  end
end
