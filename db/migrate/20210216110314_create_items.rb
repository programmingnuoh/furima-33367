class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name
      t.text :info
      t.integer :category_id
      t.integer :sales_status_id
      t.integer :shipping_fee_status_id
      t.integer :prefecture_id
      t.integer :scheduled_delivery_id
      t.integer :price
      t.timestamps

      
    end
  end
end
