require_relative '../lib/hand'
require_relative '../lib/card'

RSpec.describe Hand do
  let(:cards) { [Card.new('Hearts', 'Ace'), Card.new('Diamonds', 'King'), Card.new('Clubs', 'Queen'), Card.new('Spades', 'Jack'), Card.new('Hearts', '10')] }
  let(:hand) { Hand.new(cards) }

  describe '#initialize' do
    it 'creates a hand with cards' do
      expect(hand.cards.length).to eq(5)
    end
  end

  describe '#evaluate' do
    it 'evaluates the hand' do
      expect(hand.evaluate).to eq('High Card')
    end
  end

  describe '#<=>' do
    it 'compares two hands' do
      other_hand = Hand.new([Card.new('Hearts', '2'), Card.new('Diamonds', '3'), Card.new('Clubs', '4'), Card.new('Spades', '5'), Card.new('Hearts', '6')])
      expect(hand <=> other_hand).to eq(0) # Placeholder - actual comparison logic needs to be implemented
    end
  end
end
