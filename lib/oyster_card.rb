class Oystercard
  attr_reader :balance, :in_journey

  MAX_VALUE = 90
  MIN_VALUE = 1

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount = 0)
    raise "Cannot top up above £#{MAX_VALUE}" if (amount + @balance) > MAX_VALUE

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?(in_out)
    @in_journey = in_out
  end

  def touch_in
    raise 'Error: insufficient balance' if @balance < MIN_VALUE

    in_journey?(true)
  end

  def touch_out
    in_journey?(false)
  end
end
