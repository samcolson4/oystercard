class Oystercard
  DEAFULT_BALANCE = 0.00
  MAX_BALANCE = 90.00

  attr_reader :balance, :exceeded_balance 

  def initialize(balance = DEAFULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    raise "You've exceeded the amount" if exceeded_balance?(amount)
    @balance += amount 
   return "Your card is topped up"
  end 

  def deduct(amount)
    @balance -= amount
  end

def exceeded_balance?(amount)
  (@balance += amount) > MAX_BALANCE
end 

end
