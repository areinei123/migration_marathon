class CreateTableCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :book_id, null: false
      t.integer :category_id, null: false
      t.index [:book_id, :category_id], unique: true
    end
  end
end
