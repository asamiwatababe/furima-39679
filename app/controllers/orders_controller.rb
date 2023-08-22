class OrdersController < ApplicationController
  def index 
    @item = Iten.find(params[:item_id])
    @orderform = OrderForm.new
  end
end
