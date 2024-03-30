class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def ==(other)
    @suit == other.suit && @rank == other.rank
  end
end
