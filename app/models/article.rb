class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #belongs_to :category
  #belongs_to :day_to_ship
  #belongs_to :item_status
  #belongs_to :prefecture
  #belongs_to :shipping_charge

  #validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  #validates :day_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }
  #validates :item_status_id, numericality: { other_than: 1, message: "can't be blank" }
  #validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  #validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" }
end
