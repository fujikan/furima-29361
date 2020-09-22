class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.order("created_at DESC")
  end 

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if@item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @show = Item.find(params[:id])
    @user = User.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:name,:description,:category_id,:condition_id,:postage_id,:prefecture_id,:handling_time_id,:price,:image).merge(user_id: current_user.id)
end
end
