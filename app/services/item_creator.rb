require 'app/schemas/item'
require 'app/services/tax_calculator'

module ReceiptGenerator
  module Services
    class ItemCreator
      ITEM_REGEX = /(?<quantity>\d+) (?<name>.+) at (?<price>\d+\.\d{2})/.freeze

      ITEM_TYPES = [
        [:book, /book/],
        [:food, /chocolate/],
        [:medical, /pill/]
      ].freeze

      def self.run(item_string)
        regex_groups = parse_string(item_string)
        name = regex_groups[:name]

        item = ReceiptGenerator::Schemas::Item.new(
          regex_groups[:quantity].to_i,
          name,
          regex_groups[:price].delete('.').to_i,
          item_type(name)
        )

        item.tax_amount = ReceiptGenerator::Services::TaxCalculator.calculate_item_tax(item)

        item
      end

      def self.parse_string(item_string)
        item_string.match(ITEM_REGEX)
      end

      def self.item_type(name)
        match = ITEM_TYPES.find { |_, pattern| name.match?(pattern) }
        match ? match.first : :other
      end

      private_class_method :parse_string, :item_type
    end
  end
end
