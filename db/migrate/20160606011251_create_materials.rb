class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :manufacturer
      t.text :description
      t.integer :extruder_temp
      t.integer :bed_temp
      t.text :notes
      t.float :density
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
