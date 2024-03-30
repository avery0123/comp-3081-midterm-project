require_relative '../lib/deck'

RSpec.describe Deck do
  let(:deck) { Deck.new }

  describe '#initialize' do
    it 'creates a deck with 52 cards' do
      expect(deck.cards.length).to eq(52)
    end
  end

  describe '#shuffle' do
    it 'shuffles the deck' do
      original_order = deck.cards.dup
      deck.shuffle
      expect(deck.cards).not_to eq(original_order)
    end
  end

  describe '#deal' do
    it 'deals the specified number of cards from the deck' do
      num_cards = 5
      dealt_cards = deck.deal(num_cards)
      expect(dealt_cards.length).to eq(num_cards)
      expect(deck.cards.length).to eq(52 - num_cards)
    end
  end
end
