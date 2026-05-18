module ReceiptGenerator
  module Services
    class TaxCalculator
      NEAREST_ROUND_NUMBER = 5

      TAX_RULES = [
        ->(item) { item.exempt? ? 0 : 0.1 },
        ->(item) { item.imported? ? 0.05 : 0 }
      ].freeze

      def self.calculate_item_tax(item)
        tax_percentage = TAX_RULES.reduce(0) { |total, rule| total + rule.call(item) }

        round_tax_amount(item.unit_price * tax_percentage)
      end

      def self.round_tax_amount(amount)
        ((amount / NEAREST_ROUND_NUMBER).ceil * NEAREST_ROUND_NUMBER).to_i
      end
    end
  end
end
