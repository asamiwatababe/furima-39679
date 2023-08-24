class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index 
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_3cba736423eb80c20d0dcc29"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
