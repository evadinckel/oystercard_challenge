require 'journey'

describe Journey do
  let(:journey){Journey.new}
  let(:station) {double (:station)}

  it 'test default value' do
    expect(journey.entry_station).to eq(nil)

  end

  it 'test entry station' do
    journey.entry(station)
    expect(journey.entry_station).to eq(station)
  end

  it 'test exit station' do
    journey.exit(station)
    expect(journey.exit_station).to eq (station)
  end

  it 'records the journey history' do
    journey.entry(station)
    journey.exit(station)
    expect(journey.current).to eq ({entry: station, exit: station})
  end

  it 'resets the entry station' do
    journey.entry(station)
    journey.exit(station)
    journey.complete
    expect(journey.entry_station).to eq(nil)
  end

  it 'resets the exit station' do
    journey.entry(station)
    journey.exit(station)
    journey.complete
    expect(journey.exit_station).to eq(nil)
  end

end
