class Deliver < ApplicationRecord
  belongs_to :order_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
