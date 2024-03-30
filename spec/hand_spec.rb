require_relative '../lib/hand'
require_relative '../lib/card'

RSpec.describe Hand do
  let(:straight_flush) { Hand.new([Card.new('Hearts', '10'), Card.new('Hearts', 'Jack'), Card.new('Hearts', 'Queen'), Card.new('Hearts', 'King'), Card.new('Hearts', 'Ace')]) }
  let(:four_of_a_kind) { Hand.new([Card.new('Hearts', 'Ace'), Card.new('Diamonds', 'Ace'), Card.new('Clubs', 'Ace'), Card.new('Spades', 'Ace'), Card.new('Hearts', '10')]) }
  let(:full_house) { Hand.new([Card.new('Hearts', 'Ace'), Card.new('Diamonds', 'Ace'), Card.new('Clubs', 'Ace'), Card.new('Spades', '10'), Card.new('Hearts', '10')]) }
  let(:flush) { Hand.new([Card.new('Hearts', '2'), Card.new('Hearts', '4'), Card.new('Hearts', '6'), Card.new('Hearts', '8'), Card.new('Hearts', '10')]) }
  let(:straight) { Hand.new([Card.new('Hearts', '10'), Card.new('Diamonds', 'Jack'), Card.new('Clubs', 'Queen'), Card.new('Spades', 'King'), Card.new('Hearts', 'Ace')]) }
  let(:three_of_a_kind) { Hand.new([Card.new('Hearts', 'Ace'), Card.new('Diamonds', 'Ace'), Card.new('Clubs', 'Ace'), Card.new('Spades', '10'), Card.new('Hearts', 'King')]) }
  let(:two_pair) { Hand.new([Card.new('Hearts', 'Ace'), Card.new('Diamonds', 'Ace'), Card.new('Clubs', '10'), Card.new('Spades', '10'), Card.new('Hearts', 'King')]) }
  let(:one_pair) { Hand.new([Card.new('Hearts', 'Ace'), Card.new('Diamonds', 'Ace'), Card.new('Clubs', '2'), Card.new('Spades', '3'), Card.new('Hearts', '4')]) }
  let(:high_card) { Hand.new([Card.new('Hearts', 'Ace'), Card.new('Diamonds', 'King'), Card.new('Clubs', 'Queen'), Card.new('Spades', 'Jack'), Card.new('Hearts', '10')]) }

  describe '#initialize' do
    it 'creates a hand with cards' do
      expect(high_card.cards.length).to eq(5)
    end
  end

  describe '#evaluate' do
    it 'evaluates a straight flush' do
      expect(straight_flush.evaluate).to eq('Straight Flush')
    end

    it 'evaluates four of a kind' do
      expect(four_of_a_kind.evaluate).to eq('Four of a Kind')
    end

    it 'evaluates a full house' do
      expect(full_house.evaluate).to eq('Full House')
    end

    it 'evaluates a flush' do
      expect(flush.evaluate).to eq('Flush')
    end

    it 'evaluates a straight' do
      expect(straight.evaluate).to eq('Straight')
    end

    it 'evaluates three of a kind' do
      expect(three_of_a_kind.evaluate).to eq('Three of a Kind')
    end

    it 'evaluates two pair' do
      expect(two_pair.evaluate).to eq('Two Pair')
    end

    it 'evaluates one pair' do
      expect(one_pair.evaluate).to eq('One Pair')
    end

    it 'evaluates high card' do
      expect(high_card.evaluate).to eq('High Card')
    end
  end

  describe '#<=>' do
    it 'compares two hands' do
      other_hand = Hand.new([Card.new('Hearts', '2'), Card.new('Diamonds', '3'), Card.new('Clubs', '4'), Card.new('Spades', '5'), Card.new('Hearts', '6')])
      expect(high_card <=> other_hand).to eq(0)
    end
  end
end
