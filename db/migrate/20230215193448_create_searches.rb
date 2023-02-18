class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true, null: true
      t.string :make
      t.string :model
      t.integer :year_from
      t.integer :year_to
      t.integer :price_from
      t.integer :price_to
      t.integer :requests_quantity, default: 1, null: false

      t.timestamps
    end
  end
end
