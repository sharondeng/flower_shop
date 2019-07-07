require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  let!(:customer_order) { create(:customer_order) }
  let!(:customer) { create(:customer, customer_order: customer_order) }

  describe 'validation' do
    let(:rose_order) { build(:product_order, product_code: 'R12', customer_order: customer_order) }

    context 'valid product order' do
      it 'valid as it is combination of 5 and 10' do
        rose_order.quantity = 15
        expect(rose_order.valid?).to eq true
      end

      it 'should be valid as it is combination of 10' do
        rose_order.quantity = 40
        expect(rose_order.valid?).to eq true
      end
    end

    context 'invalid product order' do
      it 'should be valid as it is not combination of 5 and 10' do
        rose_order.quantity = 11
        expect(rose_order.valid?).to eq false
        expect(rose_order.errors.messages).to eq ({:quantity=>["No bundle available"]})
      end
    end
  end


  describe 'process bundles' do
    let(:rose_order) { build(:product_order, product_code: 'R12', customer_order: customer_order) }
    let(:lily_order) { build(:product_order, product_code: 'L09', customer_order: customer_order) }
    let(:tulip_order) { build(:product_order, product_code: 'T58', customer_order: customer_order) }

    context 'order 10 roses' do
      let(:rose_p) { Product.find_by(code: 'R12') }
      let(:package_10) { rose_p.package_bundles.find_by(num_of_item: 10) }
      let(:package_5) { rose_p.package_bundles.find_by(num_of_item: 5) }

      it 'should be 1 bundle of 10' do
        rose_order.quantity = 10
        rose_order.save
        expect(rose_order.package_orders.map(&:package_bundle)).to match ([package_10])
        expect(rose_order.package_orders.pluck(:quantity)).to match ([1])
      end

    end

    context 'order 15 lilies' do
      let(:lily_p) { Product.find_by(code: 'L09') }
      let(:package_3) { lily_p.package_bundles.find_by(num_of_item: 3) }
      let(:package_6) { lily_p.package_bundles.find_by(num_of_item: 6) }
      let(:package_9) { lily_p.package_bundles.find_by(num_of_item: 9) }

      it 'should be 1 bundle of 9 and 1 bundle of 6' do
        lily_order.quantity = 15
        lily_order.save
        expect(lily_order.package_orders.map(&:package_bundle)).to match ([package_9, package_6])
        expect(lily_order.package_orders.pluck(:quantity)).to match ([1, 1])
      end
    end

    context 'order 13 tulips' do
      let(:tulip_p) { Product.find_by(code: 'T58') }
      let(:package_3) { tulip_p.package_bundles.find_by(num_of_item: 3) }
      let(:package_5) { tulip_p.package_bundles.find_by(num_of_item: 5) }
      let(:package_9) { tulip_p.package_bundles.find_by(num_of_item: 9) }

      it 'should be 2 bundle of 5 and 1 bundle of 3' do
        tulip_order.quantity = 13
        tulip_order.save
        expect(tulip_order.package_orders.map(&:package_bundle)).to match ([package_5, package_3])
        expect(tulip_order.package_orders.pluck(:quantity)).to match ([2, 1])
      end
    end
  end
end