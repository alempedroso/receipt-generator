require 'spec/spec_helper'
require 'app/schemas/item'

describe ReceiptGenerator::Schemas::Item do
  describe '#imported?' do
    let(:imported_item) { described_class.new(1, 'imported_book', 1000, :book) }
    let(:domestic_item) { described_class.new(1, 'book', 1000, :book) }

    it 'returns true when item is imported' do
      expect(imported_item.imported?).to eq(true)
    end

    it 'returns false when item is domestic' do
      expect(domestic_item.imported?).to eq(false)
    end
  end

  describe '#exempt?' do
    let(:other_item) { described_class.new(1, 'music CD', 1000, :other) }
    let(:book_item) { described_class.new(1, 'book', 1000, :book) }
    let(:medical_item) { described_class.new(1, 'medical pills', 1000, :medical) }
    let(:food_item) { described_class.new(1, 'chocolate', 1000, :food) }

    it 'returns true when item is from taxed type' do
      expect(book_item.exempt?).to eq(true)
      expect(medical_item.exempt?).to eq(true)
      expect(food_item.exempt?).to eq(true)
    end

    it 'returns false when item is from taxed type' do
      expect(other_item.exempt?).to eq(false)
    end
  end

  describe '#full_price' do
    let(:item) { described_class.new(2, 'book', 1000, :book) }

    it 'returns price plus tax amount times quantity' do
      item.tax_amount = 100
      expect(item.full_price).to eq(2200)
    end
  end

  describe '#to_s' do
    let(:item) { described_class.new(2, 'book', 1000, :book) }

    it 'returns a string with quantity, item name and formatted full price' do
      item.tax_amount = 100
      expect(item.to_s).to eq('2 book: 22.00')
    end
  end
end
