class CreateFilaments < ActiveRecord::Migration
  def change
    create_table :filaments do |t|
      t.string :name
      t.text :material
      t.text :color
      t.integer :length
      t.integer :weight
      t.integer :cost

      t.timestamps null: false
    end
  end
end
