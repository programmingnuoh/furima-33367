class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @prefecture = Prefecture.all
    @category = Category.all
    @sales_status = SalesStatus.all
    @shipping_fee_status = ShippingFeeStatus.all
    @scheduled_delivery = ScheduledDelivery.all
  end

  def create
    Item.create(item_params)
    if item.save
      redirect_to
    else
      render
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end
