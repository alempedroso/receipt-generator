require 'app/utils/money'

module ReceiptGenerator
  module Schemas
    class Item
      include Money

      EXEMPT_ITEM_TYPES = %i[book food medical].freeze
      IMPORTED_ITEM_REGEX = /import/.freeze

      attr_reader :name, :quantity, :unit_price, :type
      attr_accessor :tax_amount

      def initialize(quantity, name, unit_price, type, tax_amount = 0)
        @quantity = quantity
        @name = name
        @unit_price = unit_price
        @type = type
        @tax_amount = tax_amount
      end

      def imported?
        @name.match?(IMPORTED_ITEM_REGEX)
      end

      def exempt?
        EXEMPT_ITEM_TYPES.include?(@type)
      end

      def full_price
        (@unit_price + @tax_amount) * @quantity
      end

      def to_s
        "#{@quantity} #{@name}: #{format_cents(full_price)}"
      end
    end
  end
end
