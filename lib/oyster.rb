class Oystercard
  DEAFULT_BALANCE = 0.00
  MAX_BALANCE = 90.00

  attr_reader :balance, :card_status

  def initialize(balance = DEAFULT_BALANCE)
    @balance = balance
    @card_status = false
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

def touch_in
  raise "Not enough money" if sufficient_balance?
  @card_status = true
end

def touch_out
  @card_status = false
end

def in_journey?
  @card_status == true
end

def sufficient_balance?
  @balance < 1
end 

end
