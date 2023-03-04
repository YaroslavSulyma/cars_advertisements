class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars, id: :uuid do |t|
      t.string :make, null: false, index: true
      t.string :model, null: false, index: true
      t.integer :year, null: false
      t.integer :odometer, null: false
      t.integer :price, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
