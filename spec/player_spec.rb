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

  describe '#discard' do
    it 'discards specified cards from the hand' do
      player.discard([0, 1])
      expect(player.hand.cards.length).to eq(3)
    end
  end

  describe '#fold' do
    it 'folds the hand' do
      player.fold
      expect(player.hand).to be_nil
    end
  end

  describe '#see' do
    it 'sees the current bet' do
      player.see(100)
      expect(player.pot).to eq(900)
    end
  end

  describe '#raise_bet' do
    it 'raises the bet' do
      player.raise_bet(200)
      expect(player.pot).to eq(800)
    end
  end
end
