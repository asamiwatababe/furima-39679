class Item < ApplicationRecord

    belongs_to :user
    #has_one :order
    has_one_attached :image
    
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :item_status_id



    end





    validates :user,        presence: true
    validates :item_status_id, presence: true
    validates :category_id, presence: true
    validates :description, presence: true
    validates :item_status_id, presence: true
    validates :name,       presence: true
    validates :shipping_charge_id, presence: true
    validates :prefecture_id, presence: true
    validates :price, presence: true
    validates :day_to_ship_id, presence: true
end
