class SetFavoriteDefaultToFalse < ActiveRecord::Migration
  def change
    change_column :notes, :favorite, :boolean, {default: 0}
  end
end
