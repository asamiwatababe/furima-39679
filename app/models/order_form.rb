class OrderForm
    include ActiveModel::Model
    attr_accessor :item_id, :user_id, :zip_code, :prefecture_id, :city, :telephone, :street, :building_name #deliverテーブルのカラム

    with_options presence: true do
        validates :item_id
        validates :user_id
        validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
        validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
        validates :city
        validates :telephone, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
        validates :street
    end

end