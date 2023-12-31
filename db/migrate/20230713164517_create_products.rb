class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :categories, array: true, default: []
      t.text :characteristics

      t.timestamps
    end
  end
end
