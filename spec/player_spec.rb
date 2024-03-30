require_relative '../lib/player'
require_relative '../lib/hand'
require_relative '../lib/card'

RSpec.describe Player do
  let(:hand) { Hand.new([Card.new('Hearts', 'Ace'), Card.new('Diamonds', 'King'), Card.new('Clubs', 'Queen'), Card.new('Spades', 'Jack'), Card.new('Hearts', '10')]) }
  let(:player) { Player.new(hand) }

  describe '#initialize' do
    it 'creates a player with a hand and a pot' do
      expect(player.hand).to eq(hand)
      expect(player.pot).to eq(1000)
    end
  end

  # Add tests for discard, fold, see, and raise_bet methods
end
