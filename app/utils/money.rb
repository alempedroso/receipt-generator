module Money
  def format_cents(cents)
    format('%0.2f', cents / 100.0)
  end

  module_function :format_cents
end
