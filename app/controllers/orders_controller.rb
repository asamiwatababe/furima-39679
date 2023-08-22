class OrdersController < ApplicationController
  def index 
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new
  end

  def create 
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
       @orderform.save(params[:item_id],current_user.id)
       redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:zip_code, :prefecture_id, :city, :telephone, :street, :building_name)
  end
end

# permitに:item_id, :user_idは必要ない？
