require 'spec/spec_helper'
require 'app/schemas/item'
require 'app/services/item_creator'

describe ReceiptGenerator::Services::ItemCreator do
  describe '#run' do
    let(:item_string) { '1 bottle of perfume at 18.99' }

    it 'creates an Item instance' do
      expect(described_class.run(item_string)).to be_instance_of(ReceiptGenerator::Schemas::Item)
    end

    it 'sets item name' do
      expect(described_class.run(item_string).name).to eq('bottle of perfume')
    end

    it 'sets item unit price in cents' do
      expect(described_class.run(item_string).unit_price).to eq(1899)
    end

    it 'sets item quantity' do
      expect(described_class.run(item_string).quantity).to eq(1)
    end

    it 'sets tax amount' do
      expect(described_class.run(item_string).tax_amount).to eq(190)
    end

    context 'item type' do
      let(:food_item_string) { '1 box of chocolates at 10.00' }
      let(:medical_item_string) { '1 packet of headache pills at 9.75' }
      let(:book_item_string) { '2 book at 12.49' }

      it 'sets food type' do
        expect(described_class.run(food_item_string).type).to eq(:food)
      end

      it 'sets medical type' do
        expect(described_class.run(medical_item_string).type).to eq(:medical)
      end

      it 'sets food type' do
        expect(described_class.run(book_item_string).type).to eq(:book)
      end

      it 'sets other type' do
        expect(described_class.run(item_string).type).to eq(:other)
      end
    end
  end
end
