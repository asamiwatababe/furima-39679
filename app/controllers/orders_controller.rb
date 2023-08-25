class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :prevent_url, only: [:index, :create]
  
  def index 
    @item = Item.find(params[:item_id])
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
  end

  def create 
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
       @order_form.save
       redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end 

  private

  def prevent_url
    if @item.user_id != current_user.id || @item.order != nil
      redirect_to root_path
    end
  end

  def order_form_params
    params.require(:order_form).permit(:zip_code, :prefecture_id, :city, :telephone, :street, :building_name). merge(item_id: params[:item_id], user_id: current_user.id, token:params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,
        card: order_form_params[:token],   
        currency: 'jpy'                 
    )
  end

end
