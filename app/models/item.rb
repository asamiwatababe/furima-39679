class Item < ApplicationRecord
    validates :user,        null: false, foreign_key: true
    validates :description, null: false
    validates :item_status, null: false
    validates :name,       null: false
    validates :shipping_charge_id, null: false
    validates :prefecture, null: false
    validates :price, null: false
    validates :day_to_ship_id, :null_false
end
