class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day_to_ship
  belongs_to :item_status
  belongs_to :prefecture
  belongs_to :shipping_charge
end
