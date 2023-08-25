class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :order] #ログアウトユーザーへの対策
  before_action :prevent_url, only: [:edit, :update, :destroy ]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]# ログインしていない場合、アクションを制限
  
    def index 
      @items = Item.all.order(created_at: :desc)  # 作成日時の新しい順に並べ替え  
    end

    def new
      @item = Item.new
    end

    def show
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render 'new',status: :unprocessable_entity
      end
    end

    def destroy
      if current_user.id == @item.user_id  # 出品者であるかを判別
        if @item.destroy
          redirect_to root_path
        else
          redirect_to root_path
        end
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

    def prevent_url
      if @item.user_id != current_user.id || @item.order != nil
        redirect_to root_path
      end
    end

    def item_params
      params.require(:item).permit(
        :image, :description, :category_id, :item_status_id,
        :name, :shipping_charge_id, :prefecture_id, :price, :day_to_ship_id
      ).merge(user_id: current_user.id)
    end
end


