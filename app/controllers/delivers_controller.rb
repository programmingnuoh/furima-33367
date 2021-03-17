class DeliversController < ApplicationController

  def index
    @deliver = Deliver.new(deliver_params)
  end

  private
  def deliver_params
    params.require(:deliver).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id,item_id: item.id)
  end  
end
