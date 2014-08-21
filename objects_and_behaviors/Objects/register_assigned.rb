##                                                                         |
# represents a register                                                    |
#                                                                          |
class Register
  attr_reader :scanned_items, :til, :register_id

  ##                                                                       |
  # creates a register object                                              |
  #                                                                        |
  def initialize(params = nil)
    @register_id = case params
                   when nil then 0
                   else params[:register_id] end
    @scanned_items = []
    @til = 0.0
  end

  ##                                                                       |
  # scans an object and adds it to the list of all scanned items from which|
  # you can use void_last method to remove the last scanned item.          |
  #                                                                        |
  # this method expresses the process of it scanning the item, displaying  |
  # to the console when has what been scanned and by which register,       |
  # register_id.                                                           |
  #                                                                        |
  # register1 = Register.new register_id: 1                                |
  # register1.scanned_items # => []                                        |
  # Cashier.new.set_register(register1).scan 123,                          |
  #                                          :barcode,                     |
  #                                          "bananas"                     |
  # register1.scanned_items # => [123, :barcode, "bananas"]                |
  #                                                                        |
  def scan(*upc)
    upc.nil? ? return : nil
    @scanned_items << upc
    rescue => e
      e.inspect
      puts e.backtrace.join("\n")
    else
      puts "Register #{@register_id}    | scanned #{upc}    | #{Time.now}   "
  end

  ##                                                                       |
  # removes the last item within the @scanned_items array.                 |
  #                                                                        |
  # register1 = Register.new register_id: 1                                |
  # register1.scanned_items # => []                                        |
  # Cashier.new.set_register(register1).scan 123,                          |
  #                                          :barcode,                     |
  #                                          "bananas"                     |
  # register1.scanned_items # => [123, :barcode, "bananas"]                |
  # register1.void_last_item # => "bananas"                                |
  # register1.scanned_items # => [123, :barcode]                           |
  #                                                                        |
  def void_last_item
    @scanned_items.pop
  end

  ##                                                                       |
  # remove upc from @scanned_items                                         |
  # register1 = Register.new register_id: 1                                |
  # register1.scanned_items # => []                                        |
  # Cashier.new.set_register(register1).scan 123,                          |
  #                                          :barcode,                     |
  #                                          "bananas"                     |
  # register1.void :barcode                                                |
  # register1.scanned_items # => [123, "bananas"]                          |
  #                                                                        |
  def void(upc)
    @scanned_items.delete upc
  end

  ##                                                                       |
  # increases the money inside the @til by_amount                          |
  #                                                                        |
  # register1 = Register.new register_id: 1                                |
  # register1.til_amount # => 0.0                                          |
  # register1.increase_til_amount 13.37                                    |
  # register1.til_amount # => 13.37                                        |
  # register1.increase_til_amount 1.04                                     |
  # register1.til_amount # => 14.41                                        |
  #                                                                        |
  def increase_til_amount(by_amount)
    @til += by_amount
  end

  ##                                                                       |
  # decreases the money inside the @til by_amount                          |
  #                                                                        |
  # register1 = Register.new register_id: 1                                |
  # register1.til_amount # => 0.0                                          |
  # register1.increase_til_amount 13.37                                    |
  # register1.til_amount # => 13.37                                        |
  # register1.decrease_til_amount 1.04                                     |
  # register1.til_amount # => 12.33                                        |
  #                                                                        |
  def decrease_til_amount(by_amount)
    @til -= by_amount
  end
end
