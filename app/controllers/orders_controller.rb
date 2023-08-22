class OrdersController < ApplicationController
  def index 
    @item = Iten.find(params[:item_id])
    @orderform = OrderForm.new
  end

  def create 
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
       @orderform.save(params,current_user.id)
       redirect_to root_path
    else
      @item = Iten.find(params[:item_id])
      render :index
    end
  end
end
