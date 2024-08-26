class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :shopping_cart, null: false, foreign_key: true
      t.integer :price_in_cents

      t.timestamps
    end
  end
end
