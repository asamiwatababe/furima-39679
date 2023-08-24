class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index 
    @item = Item.find(params[:item_id])
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
  end

  #def new
    #@item = Item.find(params[:item_id])
    #@order_form = OrderForm.new
  #end

  def create 
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
       @order_form.save(current_user.id)
       redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:zip_code, :prefecture_id, :city, :telephone, :street, :building_name). merge(item_id: params[:item_id], user_id: current_user.id, token:params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: order_form_params[:price],
        card: order_form_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
