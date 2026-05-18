require 'spec/spec_helper'
require 'app/services/tax_calculator'

describe ReceiptGenerator::Services::TaxCalculator do
  describe '.format_cents' do
    it 'converts cents to dollar with 2 decimal places' do
      expect(Money.format_cents(1000)).to eq('10.00')
    end

    it 'converts when cents amount is less than a dollar' do
      expect(Money.format_cents(77)).to eq('0.77')
    end
  end
end
