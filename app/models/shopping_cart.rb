class ShoppingCart < ApplicationRecord
  belongs_to :customer
  has_many :items

  def total_price_in_cents(percentage = 0)
    total = items.sum(&:price_in_cents)

    if total > 100
      discount = (total * (percentage / 100.0)).to_i
      total - discount
    else
      total
    end
  end
end
