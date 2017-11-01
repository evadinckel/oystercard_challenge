class Oystercard
# Oystercards objects
# attribute readers: they are methods, they return the instance variable that they share the name with
  attr_reader :balance , :entry_station
  CREDIT_LIMIT = 120
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
  end

  # def balance
  #   @balance
  # end

  # def in_journey
  #   @in_journey
  # end

  def top_up(amount)
    raise "amount above #{CREDIT_LIMIT}" if overloads?(amount)
    @balance += amount
  end


  def touch_in(station_placeholder)
    raise "Balance less than the minimum fare" if insufficient_balance?
    @entry_station=station_placeholder
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    !@entry_station.nil?
  end

private

  def overloads?(amount)
    @balance+amount > CREDIT_LIMIT
   end

   def insufficient_money?(fare)
    @balance - fare < 0
  end

  def insufficient_balance?
    @balance < MINIMUM_FARE
  end

  def deduct(fare)
    raise "Not enough money for the journey" if insufficient_money?(fare)
    @balance -= fare
  end

end
