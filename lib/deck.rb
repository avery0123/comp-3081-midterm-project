require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = generate_deck
  end

  def shuffle
    @cards.shuffle!
  end

  def deal(num_cards)
    @cards.shift(num_cards)
  end

  private

  def generate_deck
    suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
    ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    suits.product(ranks).map { |suit, rank| Card.new(suit, rank) }
  end
end
