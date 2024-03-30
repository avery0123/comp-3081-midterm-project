require_relative 'deck'
require_relative 'player'

class Game
  attr_reader :deck, :players

  def initialize(players)
    @deck = Deck.new
    @players = players
  end

  def deal_initial_hands
    players.each do |player|
      player.hand = Hand.new(deck.deal(5))
    end
  end

  def determine_winner
    # Add logic to determine the winner
  end

  def play_round
    # Add logic to play a round of the game
  end
end
