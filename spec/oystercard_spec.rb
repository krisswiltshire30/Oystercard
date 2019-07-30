require 'oyster_card.rb'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  it 'has balance functionality' do
    expect(subject).to respond_to :balance
  end

  it 'topup can take amount from user' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it 'journey will take one argument' do
    expect(subject).to respond_to(:in_journey?).with(1).argument
  end

  describe '#top_up' do
    it 'tops up the card balance' do
      expect { subject.top_up 5 }.to change { subject.balance }.by 5
    end
    it 'Raises error if above MAX_VALUE' do
      max_limit = Oystercard::MAX_VALUE
      subject.top_up(max_limit)
      expect { subject.top_up 1 }.to raise_error 'Cannot top up above £90'
    end
  end

  describe '#deduct' do
    it 'deducts amount from balance' do
      expect { subject.deduct 5 }.to change { subject.balance }.by -5
    end
  end

  describe '#touch_in' do
    it 'In journey should return true if touched in' do
      oystercard = Oystercard.new(1)
      oystercard.touch_in
      expect(oystercard.in_journey).to eq true
    end

    it 'throws an error if a card is touched in with insufficient balance' do
      expect { subject.touch_in }.to raise_error 'Error: insufficient balance'
    end
  end

  describe '#touch_out' do
    it 'In journey should return false if touched out' do
      subject.touch_out
      expect(subject.in_journey).to eq false
    end
  end
end
