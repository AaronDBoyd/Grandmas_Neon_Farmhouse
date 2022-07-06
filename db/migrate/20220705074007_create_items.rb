class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :dish
      t.string :toppings, array: true, default: []
      t.integer :cost
      t.string :size
      t.string :app_side
      t.string :drink_type
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
