require 'oyster_card.rb'

describe Oystercard do
  let(:oystercard) { described_class.new }

  it 'has balance functionality' do
    expect(subject).to respond_to :balance
  end

  it 'topup can take amount from user' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  describe '#top_up' do
    it 'tops up the card balance' do
      expect { subject.top_up 5 }.to change { subject.balance }.by 5
    end
    it 'Raises error if above MAX_VALUE' do
      oystercard = Oystercard.new(Oystercard::MAX_VALUE)
      expect { oystercard.top_up(1) }.to raise_error 'Cannot top up above £90'
    end
  end

  describe '#touch_in' do

    it 'throws an error if a card is touched in with insufficient balance' do
      oystercard = Oystercard.new(0)
      expect { oystercard.touch_in('Old Street') }.to raise_error 'Error: insufficient balance'
    end
  end

  describe '#touch_out' do
    let(:entry_station) { double :station }
    let(:exit_station) { double :station }
    let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  describe '#journey' do

    it 'Should be an empty hash by default' do
      expect(subject.journeys).to be_empty
    end

    it 'Should create one journey' do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
    end
  end
end
end
