require_relative '../spec_helper'

describe Blackjack do

  let(:jack_black) { Blackjack.new }

  describe "#initialize" do
    it "creates a deck of cards" do
      expect(jack_black.deck).to be_a(Deck)
      expect(jack_black.deck.cards).to be_an(Array)
      jack_black.deck.cards.each do |card|
        expect(card).to be_a(Card)
      end
    end

    it "Deals 4 cards, two to the player, two to the dealer" do
      expect(jack_black.deck.cards.size).to eq 48

      expect(jack_black.player_hand).to be_a(Hand)
      expect(jack_black.player_hand.cards).to be_an(Array)
      jack_black.player_hand.cards.each do |card|
        expect(card).to be_a(Card)
      end
      expect(jack_black.player_hand.cards.size).to eq 2

      expect(jack_black.dealer_hand).to be_a(Hand)
      expect(jack_black.dealer_hand.cards).to be_an(Array)
      jack_black.dealer_hand.cards.each do |card|
        expect(card).to be_a(Card)
      end
      expect(jack_black.dealer_hand.cards.size).to eq 2
    end

    it "creates a series of instance values" do
      expect(jack_black.hit).to be true
      expect(jack_black.p_stay).to be true
      expect(jack_black.d_stay).to be true
      expect(jack_black.h_or_s).to eq ''
    end
  end

  describe "#intro" do
    it "returns an introductory string" do
      expect(jack_black.intro).to be_a(String)
    end
  end

  describe "#player_hit" do
    it "returns an introductory string" do
      expect(jack_black.player_hit).to be_a(String)
    end
  end

  describe "#dealer_hit" do
    it "returns an introductory string" do
      expect(jack_black.dealer_hit).to be_a(String)
    end
  end

  describe "#player_stays" do
    it "returns an introductory string and alters variables" do
      jack_black.player_stays
      expect(jack_black.player_stays).to eq "Player stays."
      expect(jack_black.p_stay).to be false
      if jack_black.dealer_hand.calculate_hand > jack_black.player_hand.calculate_hand && @p_stay == false
        expect(jack_black.hit).to be false
      end
    end
  end

  describe "#dealer_stays" do
    it "returns an introductory string and alters variables" do
      jack_black.dealer_stays
      expect(jack_black.dealer_stays).to eq "Dealer stays."
      expect(jack_black.d_stay).to be false
      if jack_black.p_stay == false
        expect(jack_black.hit).to be false
      end
    end
  end

  describe "#winning_condition" do

    it "should return player wins, dealer wins, or tie" do

      puts "\n"
      jack_black.run

      if jack_black.player_hand.calculate_hand == 21 && jack_black.dealer_hand.calculate_hand != 21
        expect(jack_black.winning_condition).to eq ("\e[0;94;49mPlayer wins.\e[0m")
      elsif jack_black.player_hand.calculate_hand < 21 && jack_black.dealer_hand.calculate_hand > 21
        expect(jack_black.winning_condition).to eq ("\e[0;94;49mPlayer wins.\e[0m")
      elsif jack_black.player_hand.calculate_hand < 21 && jack_black.dealer_hand.calculate_hand < jack_black.player_hand.calculate_hand
        expect(jack_black.winning_condition).to eq ("\e[0;94;49mPlayer wins.\e[0m")
      elsif jack_black.player_hand.calculate_hand > 21 && jack_black.dealer_hand.calculate_hand <= 21
        expect(jack_black.winning_condition).to eq ("\e[0;31;49mDealer wins.\e[0m")
      elsif jack_black.player_hand.calculate_hand < 21 && jack_black.dealer_hand.calculate_hand > jack_black.player_hand.calculate_hand
        expect(jack_black.winning_condition).to eq ("\e[0;31;49mDealer wins.\e[0m")
      elsif jack_black.player_hand.calculate_hand != 21 && jack_black.dealer_hand.calculate_hand == 21
        expect(jack_black.winning_condition).to eq ("\e[0;31;49mDealer wins.\e[0m")
      elsif jack_black.player_hand.calculate_hand == jack_black.dealer_hand.calculate_hand
        expect(jack_black.winning_condition).to eq ("Tie. No winner.")
      elsif jack_black.player_hand.calculate_hand > 21 && jack_black.dealer_hand.calculate_hand > 21
        expect(jack_black.winning_condition).to eq ("Tie. No winner.")
      end
    end
  end
end
