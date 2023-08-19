class Item < ApplicationRecord

    belongs_to :user
    #has_one :order
    has_one_attached :image
    
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :item_status_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :day_to_ship_id
    end

    
    validates :category_id, presence: true
    validates :description, presence: true
    validates :item_status_id, presence: true
    validates :name,       presence: true
    validates :shipping_charge_id, presence: true
    validates :prefecture_id, presence: true
    validates :price, presence: true
    validates :day_to_ship_id, presence: true
    validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category, class_name: 'Category'
    belongs_to :item_status, class_name: 'ItemStatus'
    belongs_to :shipping_charge, class_name: 'ShippingCharge'
    belongs_to :prefecture, class_name: 'Prefecture'
    belongs_to :day_to_ship, class_name: 'DayToShip'
end
