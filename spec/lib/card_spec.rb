require_relative '../spec_helper'

describe Card do

  let(:card) { Card.new(4, "♦") }
  let(:face_card) { Card.new("K", "♦") }

  describe "#initialize" do
    it "Initialize should build a card from two arguments, value and suit" do
      expect(card.rank).to eq 4
      expect(card.suit).to eq "♦"
      expect(face_card.rank).to eq "K"
      expect(face_card.suit).to eq "♦"
    end
  end

  describe "#check_rank" do
    it "returns true if a passed argument matches the card's value and false if it does not match" do
      expect(card.check_rank(0)).to be false
      expect(card.check_rank(4)).to be true
      expect(face_card.check_rank("L")).to be false
      expect(face_card.check_rank("K")).to be true
    end

    it "accepts multiple arguments and return true or false" do
      expect(card.check_rank("A", "K", "Q", "J")).to be false
      expect(face_card.check_rank("A", "K", "Q", "J")).to be true
    end
  end

  describe "#display" do
    it "returns a string containing the value and suit of a card, formatted with a space after the suit" do
      expect(card.display).to eq "4♦ "
      expect(face_card.display).to eq "K♦ "
    end
  end

  describe "#check_rank" do
    it "checks through multiple arguments to ensure a card's rank matches" do
      expect(face_card.check_rank("A", "K", "Q", "J")).to be true
      expect(card.check_rank("A", "K", "Q", "J")).to be false

      expect(face_card.check_rank(2, 3, 4, 5, 6, 7, 8, 9, 10)).to be false
      expect(card.check_rank(2, 3, 4, 5, 6, 7, 8, 9, 10)).to be true
    end
  end
end
