require_relative '../lib/game'

RSpec.describe Game do
  let(:game) { Game.new("Player 1", "Player 2") }

  describe '#initialize' do
    it 'creates a game with a deck and players' do
      expect(game.deck).to be_instance_of(Deck)
      expect(game.players.length).to eq(2)
    end
  end

  describe '#deal_cards' do
    it 'deals cards to each player' do
      game.deal_cards
      expect(game.players[0].hand.cards.length).to eq(5)
      expect(game.players[1].hand.cards.length).to eq(5)
    end
  end

  describe '#bet' do
    it 'adds the bet amount to the pot and deducts from the current player' do
      game.bet(100)
      expect(game.pot).to eq(100)
      expect(game.players[0].pot).to eq(900)
    end
  end

  describe '#switch_turn' do
    it 'switches the current player' do
      game.switch_turn
      expect(game.current_player).to eq(game.players[1])
    end
  end

  describe '#discard' do
    it 'discards cards from the current player\'s hand and deals new cards' do
      game.discard([0, 1])
      expect(game.current_player.hand.cards.length).to eq(5)
    end
  end

  describe '#winner' do
    it 'determines the winner based on hand strength' do
      game.players[0].hand = Hand.new([
        Card.new('Hearts', '2'), Card.new('Hearts', '3'), Card.new('Hearts', '4'), Card.new('Hearts', '5'), Card.new('Hearts', '6')
      ])
      game.players[1].hand = Hand.new([
        Card.new('Hearts', '10'), Card.new('Diamonds', 'Jack'), Card.new('Clubs', 'Queen'), Card.new('Spades', 'King'), Card.new('Hearts', 'Ace')
      ])
      expect(game.winner).to eq(game.players[1])
    end
  end
end
