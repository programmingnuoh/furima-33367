class OrderItem < ApplicationRecord
  include ActiveModel::ActiveModel
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_number 
 
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "例）123-4567"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\d{10,11}/}
  end


  belongs_to :user
  belongs_to :item
  has_one :delivers
end
