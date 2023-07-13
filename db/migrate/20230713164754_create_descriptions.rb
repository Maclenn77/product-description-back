class CreateDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :descriptions do |t|
      t.text :segment
      t.string :season
      t.text :keywords
      t.string :usage

      t.timestamps
    end
  end
end
