require_relative '../lib/deck'

RSpec.describe Deck do
  let(:deck) { Deck.new }

  describe '#initialize' do
    it 'creates a deck of 52 cards' do
      expect(deck.cards.length).to eq(52)
    end
  end

  describe '#shuffle' do
    it 'shuffles the deck' do
      original_cards = deck.cards.dup
      deck.shuffle
      expect(deck.cards).not_to eq(original_cards)
    end
  end

  describe '#deal' do
    it 'deals a specified number of cards from the deck' do
      hand = deck.deal(5)
      expect(hand.length).to eq(5)
      expect(deck.cards.length).to eq(47)
    end
  end
end
