require_relative '../lib/game'
require_relative '../lib/player'

RSpec.describe Game do
  let(:players) { [Player.new(Hand.new([])), Player.new(Hand.new([]))] }
  let(:game) { Game.new(players) }

  describe '#initialize' do
    it 'creates a game with players and a deck' do
      expect(game.players.length).to eq(2)
      expect(game.deck).to be_an_instance_of(Deck)
    end
  end

  # Add tests for deal_initial_hands, determine_winner, and play_round methods
end
