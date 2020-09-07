class Oystercard
  DEAFULT_BALANCE = 0.00

  attr_accessor :balance

  def initialize(balance = DEAFULT_BALANCE)
    @balance = balance
  end

end