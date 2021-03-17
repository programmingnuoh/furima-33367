class CreateDelivers < ActiveRecord::Migration[6.0]
  def change
    create_table :delivers do |t|
      t.integer :post_code, null:false
      t.integer :prefecture_id, null:false
      t.string :city, nul:false
      t.string :address, null:false
      t.string :building
      t.string :phone_number, null:false
      t.references :order_item, foreign_key:true, null:false
      t.timestamps
    end
  end
end
