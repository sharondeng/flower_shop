require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  let!(:customer_order) { create(:customer_order) }
  let!(:customer) { create(:customer, customer_order: customer_order) }

  let(:rose_order) { build(:product_order, product_code: 'R12', customer_order: customer_order) }

  describe 'valid product order with bundles of 5 and 10' do

    it 'should be valid as it is combination of 5 and 10' do
      rose_order.quantity = 15
      expect(rose_order.valid?).to eq true
    end

    it 'should be valid as it is combination of 10' do
      rose_order.quantity = 40
      expect(rose_order.valid?).to eq true
    end
  end

  describe 'invalid product order with bundles of 5 and 10' do
    it 'should be valid as it is not combination of 5 and 10' do
      rose_order.quantity = 11
      expect(rose_order.valid?).to eq false
      expect(rose_order.errors.messages).to eq ({:quantity=>["No bundle available"]})
    end
  end


end