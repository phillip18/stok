class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :nome
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
