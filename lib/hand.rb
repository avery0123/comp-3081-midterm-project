require_relative 'card'

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def evaluate
    return 'Straight Flush' if straight_flush?
    return 'Four of a Kind' if four_of_a_kind?
    return 'Full House' if full_house?
    return 'Flush' if flush?
    return 'Straight' if straight?
    return 'Three of a Kind' if three_of_a_kind?
    return 'Two Pair' if two_pair?
    return 'One Pair' if one_pair?

    'High Card'
  end

  def <=>(other)
    my_strength = hand_strength(self)
    other_strength = hand_strength(other)

    return my_strength <=> other_strength unless my_strength == other_strength

    compare_highest_cards(other)
  end

  private

  def hand_strength(hand)
    hand_strengths = {
      'Straight Flush' => 9,
      'Four of a Kind' => 8,
      'Full House' => 7,
      'Flush' => 6,
      'Straight' => 5,
      'Three of a Kind' => 4,
      'Two Pair' => 3,
      'One Pair' => 2,
      'High Card' => 1
    }
    evaluate_strength = evaluate
    hand_strengths[evaluate_strength]
  end

  def straight_flush?
    return false unless flush?
    straight?
  end

  def four_of_a_kind?
    card_ranks = @cards.map(&:rank)
    card_ranks.any? { |rank| card_ranks.count(rank) == 4 }
  end

  def full_house?
    card_ranks = @cards.map(&:rank)
    card_ranks.uniq.size == 2 && (card_ranks.count(card_ranks[0]) == 3 || card_ranks.count(card_ranks[0]) == 2)
  end

  def flush?
    suit = @cards.first.suit
    @cards.all? { |card| card.suit == suit }
  end

  def straight?
    card_ranks = @cards.map(&:rank).sort
    (card_ranks.last - card_ranks.first) == 4 && card_ranks.uniq.size == 5
  end

  def three_of_a_kind?
    card_ranks = @cards.map(&:rank)
    card_ranks.any? { |rank| card_ranks.count(rank) == 3 }
  end

  def two_pair?
    card_ranks = @cards.map(&:rank)
    card_ranks.uniq.size == 3 && card_ranks.count(card_ranks[0]) == 2 && card_ranks.count(card_ranks[4]) == 2
  end

  def one_pair?
    card_ranks = @cards.map(&:rank)
    card_ranks.uniq.size == 4
  end

  def compare_highest_cards(other)
    my_highest_card = @cards.max_by { |card| card.rank }
    other_highest_card = other.cards.max_by { |card| card.rank }

    my_highest_card.rank <=> other_highest_card.rank
  end
end
