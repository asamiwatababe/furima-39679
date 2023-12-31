class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :deliver

  validates :user, presence: true
  validates :item, presence: true
end


