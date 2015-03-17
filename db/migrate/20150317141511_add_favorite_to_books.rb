class AddFavoriteToBooks < ActiveRecord::Migration
  def change
    add_column :books, :favorite, :boolean, {default: false, null: false}
  end
end
