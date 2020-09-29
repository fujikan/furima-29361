class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = LoseItem.new(lose_item_params)
    @item = Item.find(params[:item_id])
    @order.save
    if @order.valid?
      pay_item
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def lose_item_params
  params.permit(:post_code,:prefecture_id,:city,:address,:building_name,:phone_number,:item_id,:token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_d12de9e3264e9d8b4060dc9a"
    Payjp::Charge.create(
      amount: @item.price,
      card: lose_item_params[:token],
      currency:'jpy'
    )
  end
end
