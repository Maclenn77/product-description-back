class AddProductIdToDescriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :descriptions, :product_id, :integer
  end
end