class Order
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id,:token
 
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "例）123-4567"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\d{10,11}/}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order_item = OrderItem.create(user_id:user_id, item_id:item_id)
    Deliver.create(post_code:post_code, prefecture_id:prefecture_id, city:city, address:address,building:building,phone_number:phone_number, order_item_id:order_item.id)
  end

end