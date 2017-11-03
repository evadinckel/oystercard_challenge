require 'journey'

describe Journey do

 it 'test default value' do
   journey =Journey.new
   expect(journey.entry_station).to eq(nil)

 end

 it 'test entry station' do
   journey = Journey.new
   journey.entry('station')
   expect(journey.entry_station).to eq('station')
 end


end

# it 'changes status after touching out' do
#   minimum_bal = Oystercard::MINIMUM_FARE
#   card=Oystercard.new(minimum_bal)
#   card.touch_in(station)
#   card.touch_out(exit_station)
#   expect(card.in_journey?).to eq false
# end
