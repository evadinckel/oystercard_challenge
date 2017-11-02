require 'station'

describe Station do
subject { described_class.new("Hoxton", 2)}


it 'tests the creation of station' do
  expect(subject.station).to eq "Hoxton"
end
it 'tests the creation of zone' do
  expect(subject.zone).to eq 2
end

end
