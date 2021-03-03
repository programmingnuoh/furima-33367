class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :info
    validates :price, numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: {with: /\A[0-9]+\z/ }
    with_options numericality:{ other_than: 0 } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_status_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
  end
  validates :image, presence: true

  belongs_to :user
  has_one :order_item
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
end
