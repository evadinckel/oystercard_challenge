require_relative "journey.rb"
#or require './lib/journey'
class Oystercard
# Oystercards objects
# attribute readers: they are methods, they return the instance variable that they share the name with
  attr_reader :balance, :journeys , :journey, :station, :exitstation
  CREDIT_LIMIT = 120
  MINIMUM_FARE = 1

  def initialize(balance = 0, journey = Journey.new)
    @balance = balance
    @journeys = []
    @journey = journey
    @station = station
    @exitstation = exitstation
  end

  def top_up(amount)
    raise "amount above #{CREDIT_LIMIT}" if overloads?(amount)
    @balance += amount
  end

  def touch_in(station_placeholder='none')
    raise "Balance less than the minimum fare" if insufficient_balance?
    @station = station_placeholder
    journey.entry(station_placeholder)
  end

  def touch_out(exit_placeholder='none')
    #deduct
    @exitstation = exit_placeholder
    fare(@station,@exitstation)
    journey.exit(exit_placeholder)
    @journeys << journey.current
    # journey.complete
  end

  def fare(station1, station2)
    if station1 = 'none' || station2 = 'none'
      @balance -= 6 * MINIMUM_FARE
    else
      @balance -= MINIMUM_FARE
    end
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

  # def deduct
  #   @balance -= MINIMUM_FARE
  # end

  def fare(station1, station2)
    if station1 = 'none' || station2 = 'none'
      @balance -= 6 * MINIMUM_FARE
    else
      @balance -= MINIMUM_FARE
    end
  end
  
end
