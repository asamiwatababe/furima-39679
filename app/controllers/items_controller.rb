class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

    def index 
      @items = Item.all  
    end

    def new
      @item = Item.new
    end

    def create
      Item.create(item_params)
      redirect_to '/'
    end

    def item_params
      params.require(:item).permit(:image).merge(:user, :description, :category_id, :item_status_id, :name, :shipping_charge, :prefecture, :price, :day_to_ship_id)
    end
end
