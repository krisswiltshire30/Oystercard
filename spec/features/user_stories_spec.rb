require './lib/oyster_card.rb'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  describe 'User Stories' do

    describe 'Money topup' do
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
      oystercard = Oystercard.new(Oystercard::MIN_VALUE)
      expect(oystercard.balance).to eq 1
    end
  end
end
