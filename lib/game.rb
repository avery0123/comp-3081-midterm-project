require_relative 'deck'
require_relative 'hand'
require_relative 'player'

class Game
  attr_reader :deck, :players, :pot, :current_player

  def initialize(*names)
    @deck = Deck.new
    @players = names.map { |name| Player.new(name, Hand.new(@deck.deal(5))) }
    @pot = 0
    @current_player = @players.first
  end

  def deal_cards
    @players.each { |player| player.hand = Hand.new(@deck.deal(5)) }
  end

  def bet(amount)
    @pot += amount
    @current_player.pot -= amount
  end

  def switch_turn
    current_index = @players.index(@current_player)
    next_index = (current_index + 1) % @players.length
    @current_player = @players[next_index]
  end

  def discard(cards_to_discard)
    cards_to_discard.each { |index| @current_player.hand.cards.delete_at(index) }
    @current_player.hand.cards.concat(@deck.deal(cards_to_discard.length))
  end

  def winner
    winning_player = @players.first
    @players.each do |player|
      if player.hand > winning_player.hand
        winning_player = player
      end
    end
    winning_player
  end
end
