class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

    def index 
      # @items = Item.all  
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        # flash.now[:error] = @item.errors.full_messages
        render 'new',status: :unprocessable_entity
      end
    end

    def item_params
      params.require(:item).permit(
        :image, :description, :category_id, :item_status_id,
        :name, :shipping_charge_id, :prefecture_id, :price, :day_to_ship_id
      ).merge(user_id: current_user.id)
    end
end


