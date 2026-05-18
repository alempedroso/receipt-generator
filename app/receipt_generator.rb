require 'app/services/item_creator'
require 'app/schemas/purchase'
require 'app/utils/money'

module ReceiptGenerator
  extend Money

  def self.run(file_path)
    items = File.readlines(file_path, chomp: true).map do |line|
      ReceiptGenerator::Services::ItemCreator.run(line)
    end

    purchase = ReceiptGenerator::Schemas::Purchase.new(items)

    puts format_receipt(purchase)
  end

  def self.format_receipt(purchase)
    output = purchase.items.reduce('') { |items_output, item| items_output << "#{item}\n" }

    output << "Sales Taxes: #{format_cents(purchase.calculate_total_sales_taxes)}\n"
    output << "Total: #{format_cents(purchase.calculate_total_price)}"

    output
  end

  private_class_method :format_receipt
end
