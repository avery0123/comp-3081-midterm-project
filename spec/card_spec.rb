require_relative '../lib/card'

RSpec.describe Card do
  let(:card) { Card.new('Hearts', 'Ace') }

  describe '#initialize' do
    it 'creates a new card with suit and value' do
      expect(card.suit).to eq('Hearts')
      expect(card.value).to eq('Ace')
    end
  end

  describe '#==' do
    it 'compares two cards for equality' do
      same_card = Card.new('Hearts', 'Ace')
      different_card = Card.new('Diamonds', 'Ace')
      expect(card == same_card).to be true
      expect(card == different_card).to be false
    end
  end

  describe '#to_s' do
    it 'returns string representation of the card' do
      expect(card.to_s).to eq('Ace of Hearts')
    end
  end
end
