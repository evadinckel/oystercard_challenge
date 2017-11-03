require_relative "journey.rb"
#or require './lib/journey'
class Oystercard
# Oystercards objects
# attribute readers: they are methods, they return the instance variable that they share the name with
  attr_reader :balance, :journeys , :journey
  CREDIT_LIMIT = 120
  MINIMUM_FARE = 1

  def initialize(balance = 0, journey = Journey.new)
    @balance = balance
    @journeys = []
    @journey = journey
  end

  def top_up(amount)
    raise "amount above #{CREDIT_LIMIT}" if overloads?(amount)
    @balance += amount
  end

  def touch_in(station_placeholder)
    raise "Balance less than the minimum fare" if insufficient_balance?
    journey.entry_station(station_placeholder)
  end

  def touch_out(exit_placeholder)
    deduct
    journey.exit_station(exit_placeholder)
    @journeys << journey.current
    # journey.complete
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

  def deduct
    @balance -= MINIMUM_FARE
  end

end
