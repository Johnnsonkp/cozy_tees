class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :price
      t.string :sex
      t.string :color
      t.string :brand
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.integer :condition
      t.string :size

      t.timestamps
    end
  end
end
