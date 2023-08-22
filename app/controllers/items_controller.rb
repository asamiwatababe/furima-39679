class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  #before_action :set_item,except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create, :show, :edit]# ログインしていない場合、アクションを制限
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]# 特定の事前確認,制限
  
    def index 
      @items = Item.all.order(created_at: :desc)  # 作成日時の新しい順に並べ替え  
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

    def show
      
    end

    def destroy
      if @item.destroy
        redirect_to root_path
      else
        redirect_to root_path
      end
    end

    def edit
      
      unless current_user.id == @item.user_id
        redirect_to root_path
      end
    end
  
    def update
      
      if @item.update(item_params)
        redirect_to item_path(@item)
      else
        render :edit,status: :unprocessable_entity
      end
    end

    private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(
        :image, :description, :category_id, :item_status_id,
        :name, :shipping_charge_id, :prefecture_id, :price, :day_to_ship_id
      ).merge(user_id: current_user.id)
    end
end


