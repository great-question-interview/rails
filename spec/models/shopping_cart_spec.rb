require "test_helper"

RSpec.describe ShoppingCart do
  context '#total_price_in_cents' do
    subject { shopping_cart.total_price_in_cents(percentage) }

    let(:customer) { Customer.create }
    let(:shopping_cart) { ShoppingCart.create(customer: customer) }
    let!(:item1) { Item.create(shopping_cart: shopping_cart, price_in_cents: price1) }
    let!(:item2) { Item.create(shopping_cart: shopping_cart, price_in_cents: price2) }
    let(:percentage) { nil }

    context 'when no discount value is passed' do
      let(:price1) { 10 }
      let(:price2) { 20 }

      it 'calculates the total price' do
        expect(subject).to eq(30)
      end
    end

    context 'when total price is below 100' do
      let(:price1) { 10 }
      let(:price2) { 20 }
      let(:percentage) { 10 }

      it 'works' do
        expect(subject).to eq(30)
      end
    end

    context 'when total price is above 100' do
      let(:price1) { 50 }
      let(:price2) { 60 }
      let(:percentage) { 10 }

      it 'works' do
        expect(subject).to eq(99)
      end
    end
  end
end
