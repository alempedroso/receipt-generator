require 'spec/spec_helper'
require 'app/receipt_generator'

describe ReceiptGenerator do
  describe '#run' do
    it 'prints the detailed receipt do stdout' do
      expect { ReceiptGenerator.run('purchases/purchase1.txt') }.to output(/2 book: 24\.98/).to_stdout
      expect { ReceiptGenerator.run('purchases/purchase1.txt') }.to output(/1 music CD: 16\.49/).to_stdout
      expect { ReceiptGenerator.run('purchases/purchase1.txt') }.to output(/1 chocolate bar: 0\.85/).to_stdout
      expect { ReceiptGenerator.run('purchases/purchase1.txt') }.to output(/Sales Taxes: 1\.50/).to_stdout
      expect { ReceiptGenerator.run('purchases/purchase1.txt') }.to output(/Total: 42\.32/).to_stdout
    end
  end
end
