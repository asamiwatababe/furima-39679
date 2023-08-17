class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

    def index 
      @items = Item.all  
    end

    def item_params
      params.require(:item).permit(:image).merge(user_id: current_user.id)
    end
end
