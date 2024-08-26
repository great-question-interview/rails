class AddsCustomerToShoppingCart < ActiveRecord::Migration[7.0]
  def change
    add_reference :shopping_carts, :customer, null: false, foreign_key: true
  end
end
