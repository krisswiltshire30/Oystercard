require './lib/oyster_card.rb'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  describe 'User Stories' do

    describe '#top_up' do
      # In order to use public transport
      # As a customer
      # I want money on my card
      it 'in order to use public transport, money should be put onto the oystercard' do

        expect { oystercard.top_up(1) }.not_to raise_error
      end
    end
    # In order to pay for my journey
    # As a customer
    # I need to have the minimum amount (£1) for a single journey.
    it 'Should have a minimum amount of £1 on oystercard' do
      oystercard = Oystercard.new(Oystercard::MIN_CHARGE)
      expect(oystercard.balance).to eq 1
    end
  end

  describe '#touch_out' do
  # In order to pay for my journey
  # As a customer
  # When my journey is complete, I need the correct amount deducted from my card
  it 'Should deduct money from balance when touched out' do
    expect{ oystercard.touch_out('Oxford Street')}.to change {oystercard.balance}.by(-Oystercard::MIN_CHARGE)
  end
end
  # In order to pay for my journey
  # As a customer
  # I need to know where I've travelled from
  it 'Oystercard should record where journey started' do
    oystercard = Oystercard.new(Oystercard::MAX_VALUE)
    expect{oystercard.touch_in('Old Street')}.to change {oystercard.entry_station}.to 'Old Street'
  end

  describe 'previous trips' do
    # In order to know where I have been
    # As a customer
    # I want to see all my previous trips
    # it 'Should output previous trips' do
    #   allow oystercard.to receive(:journey_list).and_return ({'Old Street' => 'Oxford Street'})
    #   expect(oystercard.journey_list).to eq {'Old Street' => 'Oxford Street'}
    # end
  end
end
