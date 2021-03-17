class OrderItem < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one :deliver
end
