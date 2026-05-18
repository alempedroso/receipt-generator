$LOAD_PATH.unshift(__dir__)

require 'app/receipt_generator'

ReceiptGenerator.run('purchases/purchase1.txt')
puts "\n"
ReceiptGenerator.run('purchases/purchase2.txt')
puts "\n"
ReceiptGenerator.run('purchases/purchase3.txt')
