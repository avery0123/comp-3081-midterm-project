require_relative 'hand'

class Player
  attr_reader :hand, :pot

  def initialize(hand)
    @hand = hand
    @pot = 1000 # Starting pot amount
  end

  def discard(indices)
    # Add logic to discard cards from the hand
    # Indices parameter represents the positions of cards to discard
  end

  def fold
    # Add logic to fold the hand
  end

  def see(bet)
    # Add logic to see the current bet
  end

  def raise_bet(amount)
    # Add logic to raise the bet
  end
end
