require_relative 'card'

class Deck
  SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades'].freeze
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'].freeze

  attr_reader :cards

  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal(num)
    @cards.shift(num)
  end
end
