class CreatePrints < ActiveRecord::Migration
  def change
    create_table :prints do |t|
      t.string :name
      t.integer :length
      t.integer :weight
      t.integer :price

      t.timestamps null: false
    end
  end
end
