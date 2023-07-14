class AddResultToDescriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :descriptions, :result, :text
  end
end
