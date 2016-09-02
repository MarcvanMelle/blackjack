require_relative "../spec_helper"

describe Deck do

  let(:deck) { Deck.new }

  describe "#initialze" do
    it "creates an array of 52 card objects" do
      expect(deck.cards).to be_an(Array)
      expect(deck.cards.size).to eq 52
      deck.cards.each do |card|
        expect(card).to be_a(Card)
      end
    end

    describe "#build_deck" do
      it "returns an array of 52 cards objects" do
        expect(deck.build_deck).to be_an(Array)
        expect(deck.build_deck.size).to eq 52
        deck.build_deck.each do |card|
          expect(card).to be_a(Card)
        end
      end
    end

    describe "#deal" do
      it "returns an array of X card objects" do
        expect(deck.deal(2)).to be_an(Array)
        expect(deck.deal(2).size).to eq 2
        deck.deal(2).each do |card|
          expect(card).to be_a(Card)
        end

        expect(deck.deal(5)).to be_an(Array)
        expect(deck.deal(5).size).to eq 5
        deck.deal(2).each do |card|
          expect(card).to be_a(Card)
        end
      end
    end
  end
end
