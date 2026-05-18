module ReceiptGenerator
  module Schemas
    class Purchase
      attr_reader :items

      def initialize(items)
        @items = items
      end

      def calculate_total_sales_taxes
        items.reduce(0) do |total, item|
          total + (item.tax_amount * item.quantity)
        end
      end

      def calculate_total_price
        items.reduce(0) do |total, item|
          total + item.full_price
        end
      end
    end
  end
end
