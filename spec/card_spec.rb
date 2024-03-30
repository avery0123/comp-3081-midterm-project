require_relative '../lib/card'

RSpec.describe Card do
  describe '#initialize' do
    it 'creates a card with suit and rank' do
      card = Card.new('Hearts', 'Ace')
      expect(card.suit).to eq('Hearts')
      expect(card.rank).to eq('Ace')
    end
  end

  describe '#==' do
    it 'checks if two cards are equal' do
      card1 = Card.new('Hearts', 'Ace')
      card2 = Card.new('Hearts', 'Ace')
      card3 = Card.new('Spades', 'Ace')
      expect(card1 == card2).to eq(true)
      expect(card1 == card3).to eq(false)
    end
  end
end
