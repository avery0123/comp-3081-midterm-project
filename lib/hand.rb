require_relative 'card'

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def evaluate

    "High Card"
  end

  def <=>(other)

    0
  end
end
