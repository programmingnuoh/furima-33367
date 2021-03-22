class DeliversController < ApplicationController

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

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token:params[:token])
  end  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: 3000,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
