class OrderForm
    include ActiveModel::Model
    attr_accessor :order, :zip_code, :prefecture_id, :city, :telephone, :street, :building_name #deliverテーブルのカラム

end