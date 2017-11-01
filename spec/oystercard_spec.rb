require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:station) { double(:station)}

  describe 'initialize' do
    it 'Check if oystercard has a balance equal to 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up) }
    it 'checking top-up' do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end
  end

  context 'raising errors' do
    it "raises and error when amount is above limit" do
      maximum_balance = Oystercard::CREDIT_LIMIT
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error "amount above #{maximum_balance}"
    end
  end

  describe 'touch_out' do
    it "raises an error when insufficient balance" do
      expect { subject.touch_out }.to raise_error "Not enough money for the journey"
    end
    it 'changes status after touching out' do
      minimum_bal = Oystercard::MINIMUM_FARE
      card=Oystercard.new(minimum_bal)
      card.touch_in(station)
      card.touch_out
      expect(card.in_journey?).to eq false
    end
    it 'reduces the balance of the card by minimum fare' do
      subject.top_up(6)
      subject.touch_in(station)
      expect { subject.touch_out}.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
    end
    it 'forgets the entry station on touch out' do
      subject.top_up(6)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end
  end

  describe 'journey status' do
    it 'initial status not in journey' do
      card=Oystercard.new
      expect(card.in_journey?).to eq false
    end
  end

  describe 'touch in' do
    it 'change status after touching in' do
      minimum_bal = Oystercard::MINIMUM_FARE
      card=Oystercard.new(minimum_bal)
      card.touch_in(station)
      expect(card.in_journey?).to eq true
    end
    it 'raises an error at touch in if minimum balance is less than 1' do
      card = Oystercard.new
      expect { card.touch_in(station) }.to raise_error "Balance less than the minimum fare"
    end
    it 'remembers the entry station after touch in' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end
end
