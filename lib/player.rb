require_relative 'hand'

class Player
  attr_reader :hand, :pot

  def initialize(hand)
    @hand = hand
    @pot = 1000
  end

  def discard(indices)

    indices.each { |index| @hand.cards.delete_at(index) }
  end

  def fold

    @hand = nil
  end

  def see(bet)

    @pot -= bet
  end

  def raise_bet(amount)

    @pot -= amount
  end
end
