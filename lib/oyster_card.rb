class Oystercard
  attr_reader :balance, :in_journey, :entry_station

  MAX_VALUE = 90
  MIN_CHARGE = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
  end

  def top_up(amount = 0)
    raise "Cannot top up above £#{MAX_VALUE}" if (amount + @balance) > MAX_VALUE
    @balance += amount
  end

  def in_journey?
    entry_station
  end

  def touch_in(station)
    raise 'Error: insufficient balance' if @balance < MIN_CHARGE
    @entry_station = station
  end

  def touch_out
    deduct(MIN_CHARGE)
    @entry_station = nil
  end

private
  def deduct(amount)
    @balance -= amount
  end
end
