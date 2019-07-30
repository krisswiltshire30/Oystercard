class Oystercard
  attr_reader :balance, :journeys

  MAX_VALUE = 90
  MIN_CHARGE = 1

  def initialize(balance = 1)
    @balance = balance
    @journeys = {}
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
    @journeys.store(:entry_station, station)
  end

  def touch_out(station)
    deduct(MIN_CHARGE)
    @exit_station = station
    @journeys.store(:exit_station, station)
  end

private
  def deduct(amount)
    @balance -= amount
  end
end

# test = Oystercard.new
# test.touch_in('station1')
# test.touch_out('station2')
# puts test.journeys
