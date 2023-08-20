class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.integer :category, null: false
      t.integer :item_status, null: false
      t.integer :shipping_charge, null: false
      t.integer :prefecture, null: false
      t.integer :day_to_ship, null: false

      t.timestamps
    end
  end
end
