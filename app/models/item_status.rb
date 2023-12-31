class ItemStatus < ActiveHash::Base
    self.data = [
      { id: 1, item_status: '---' },
      { id: 2, item_status: '新品・未使用' },
      { id: 3, item_status: '未使用に近い' },
      { id: 4, item_status: '目立った傷や汚れなし' },
      { id: 5, item_status: 'やや傷や汚れあり' },
      { id: 6, item_status: '傷や汚れあり' },
      { id: 7, item_status: '全体的に状態が悪い' }
    ]

  include ActiveHash::Associations
  has_many :items
end