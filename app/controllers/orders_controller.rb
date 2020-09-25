class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @item = Item.find(params[:item_id])
  end

  private
  def item_params
  params.require(:item).permit(:name,:description,:category_id,:condition_id,:postage_id,:prefecture_id,:handling_time_id,:price,:image).merge(user_id: current_user.id)
  end
end
