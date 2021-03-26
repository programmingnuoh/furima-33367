class DeliversController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :authenticate_user!
  before_action :check_present, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end  
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token:params[:token])
  end  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def check_present
    if @item.order_item.present? || current_user.id == @item.user_id
      redirect_to root_path
    end    
  end
end
