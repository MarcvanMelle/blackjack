require_relative "../spec_helper"

describe Hand do

  let(:deck) { Deck.new }
  let(:player_hand_1) { Hand.new([Card.new(4, "♦︎"), Card.new("K", "♠︎")]) }
  let(:player_hand_2) { Hand.new([Card.new(8, "♦︎"), Card.new(7, "♠︎")]) }
  let(:player_hand_3) { Hand.new([Card.new("A", "♦︎"), Card.new("K", "♠︎")]) }
  let(:player_hand_4) { Hand.new([Card.new("A", "♦︎"), Card.new("A", "♠︎")]) }
  let(:player_hand_5) { Hand.new([Card.new("K", "♦︎"), Card.new("A", "♠︎"), Card.new("A", "♣︎")]) }
  let(:player_hand_6) { Hand.new([Card.new("Q", "♦︎"), Card.new("K", "♠︎")]) }
  let(:player_hand_7) { Hand.new([Card.new("A", "♣︎"), Card.new(3, "♦︎"), Card.new(5, "♠︎"), Card.new(10, "♥︎"), Card.new("A", "♠︎"), Card.new("A", "♣︎"), Card.new("K", "♥︎")]) }

  describe "#initialize" do
    it "builds a Hand class from an Array containing Cards" do
      expect(player_hand_1.cards).to be_an(Array)
      expect(player_hand_1.cards.size).to eq 2
      player_hand_1.cards.each do |card|
        expect(card).to be_a(Card)
      end

      expect(player_hand_7.cards).to be_an(Array)
      expect(player_hand_7.cards.size).to eq 7
      player_hand_7.cards.each do |card|
        expect(card).to be_a(Card)
      end
    end
  end

  describe "#calculate_hand" do
    it "returns a fixnum corresponding to the values of all cards in hand combined" do
      expect(player_hand_1.calculate_hand).to eq 14
      expect(player_hand_2.calculate_hand).to eq 15
      expect(player_hand_3.calculate_hand).to eq 21
      expect(player_hand_4.calculate_hand).to eq 12
      expect(player_hand_5.calculate_hand).to eq 12
      expect(player_hand_6.calculate_hand).to eq 20
      expect(player_hand_7.calculate_hand).to eq 31
    end
  end

  describe "#hit" do
    it "pushes the last value of the deck into the hand, and returns the hand" do
      expect(deck.cards[-1]).to eq(player_hand_1.hit(deck)[-1])
    end
  end
end
