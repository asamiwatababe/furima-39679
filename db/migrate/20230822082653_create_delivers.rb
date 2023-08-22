class CreateDelivers < ActiveRecord::Migration[7.0]
  def change
    create_table :delivers do |t|
      t.references :order, nll: false, foreign_key: true
      t.string     :zip_code, null: false
      t.integer    :prefecture, null: false
      t.string     :city, null: false
      t.string     :telephone, null: false
      t.string     :street, null: false
      t.string     :building_name

      t.timestamps
    end
  end
end
