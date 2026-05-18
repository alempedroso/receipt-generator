require 'spec/spec_helper'
require 'app/schemas/purchase'
require 'app/services/item_creator'

describe ReceiptGenerator::Schemas::Purchase do
  let(:item1) { ReceiptGenerator::Services::ItemCreator.run('1 imported box of chocolates at 10.00') }
  let(:item2) { ReceiptGenerator::Services::ItemCreator.run('1 imported bottle of perfume at 47.50') }
  let(:purchase) { described_class.new([item1, item2]) }

  describe '.calculate_total_sales_taxes' do
    it 'sums up the taxes of the items' do
      expect(purchase.calculate_total_sales_taxes).to eq(765)
    end
  end

  describe '.calculate_total_price' do
    it 'sums up the full prices of the items' do
      expect(purchase.calculate_total_price).to eq(6515)
    end
  end
end
