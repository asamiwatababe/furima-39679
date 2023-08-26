class Deliver < ApplicationRecord
  belongs_to :order

  validates :order, presence: true
  validates :zip_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :telephone, presence: true
  validates :street, presence: true
end
