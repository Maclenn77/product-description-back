class AddBaseDescriptionToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :base_description, :text
  end
end
