class AddLanguageToDescriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :descriptions, :language, :string
  end
end
