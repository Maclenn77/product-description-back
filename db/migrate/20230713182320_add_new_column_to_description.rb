class AddNewColumnToDescription < ActiveRecord::Migration[7.0]
  def change
    add_column :descriptions, :creativity, :string
  end
end
