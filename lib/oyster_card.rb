class Oystercard

  attr_reader :balance, :in_journey

  MAX_VALUE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Cannot top up above £#{MAX_VALUE}" if (amount + @balance) > MAX_VALUE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?(in_out)
    @in_journey = in_out
  end

  def touch_in
    in_journey?(true)
  end

  def touch_out
    in_journey?(false)
  end
end
