require_relative "../spec/spec_helper"
require 'colorize'
require 'colorized_string'

class Blackjack

  attr_accessor :deck, :player_hand, :dealer_hand, :hit, :p_stay, :d_stay, :h_or_s

  def initialize
    @deck = Deck.new
    @player_hand = Hand.new(@deck.deal(2))
    @dealer_hand = Hand.new(@deck.deal(2))
    @hit = true
    @p_stay = true
    @d_stay = true
    @h_or_s = ''
  end

  def intro
    "Welcome to the casino!\nLet's play Blackjack!\n" + "Player was dealt a #{player_hand.cards[0].display}and a #{player_hand.cards[1].display}\nPlayer at: #{player_hand.calculate_hand}.\n".colorize(:light_blue) + "Dealer was dealt a #{dealer_hand.cards[0].display}and a #{dealer_hand.cards[1].display}\nDealer at: #{dealer_hand.calculate_hand}".colorize(:red)
  end

  def player_hit
    player_hand.hit(deck)
    "Player hits.".colorize(:cyan) + "\nPlayer was dealt a #{player_hand.cards[-1].display}\nPlayer at: #{player_hand.calculate_hand}".colorize(:light_blue)
  end

  def dealer_hit
    dealer_hand.hit(deck)
    "Dealer hits.".colorize(:magenta) + "\nDealer was dealt a #{dealer_hand.cards[-1].display}\nDealer at: #{dealer_hand.calculate_hand}".colorize(:red)
  end

  def player_stays
    @p_stay = false
    if dealer_hand.calculate_hand > player_hand.calculate_hand && @p_stay == false
      @hit = false
    end
    return "Player stays."
  end

  def dealer_stays
    @d_stay = false
    if @p_stay == false
      @hit = false
    end
    return "Dealer stays."
  end

  def winning_condition
    if player_hand.calculate_hand == 21 && dealer_hand.calculate_hand != 21
      return "Player wins.".colorize(:light_blue)
    elsif player_hand.calculate_hand < 21 && dealer_hand.calculate_hand > 21
      return "Player wins.".colorize(:light_blue)
    elsif player_hand.calculate_hand < 21 && dealer_hand.calculate_hand < player_hand.calculate_hand
      return "Player wins.".colorize(:light_blue)
    elsif player_hand.calculate_hand > 21 && dealer_hand.calculate_hand <= 21
      return "Dealer wins.".colorize(:red)
    elsif player_hand.calculate_hand < 21 && dealer_hand.calculate_hand > player_hand.calculate_hand
      return "Dealer wins.".colorize(:red)
    elsif player_hand.calculate_hand != 21 && dealer_hand.calculate_hand == 21
      return "Dealer wins.".colorize(:red)
    elsif player_hand.calculate_hand == dealer_hand.calculate_hand
      return "Tie. No winner."
    elsif player_hand.calculate_hand > 21 && dealer_hand.calculate_hand > 21
      return "Tie. No winner."
    end
  end

  def run

    puts intro

    while hit
      break if tie?(dealer_hand, player_hand)
      break if dealer_bust?(dealer_hand, player_hand)
      break if player_bust?(dealer_hand, player_hand)


      if dealer_hand.calculate_hand < 17 && !@d_stay
        puts dealer_hit
        break if dealer_bust?(dealer_hand, player_hand)
      else
        dealer_stays
      end

      if @p_stay
        h_or_s = input(player_hand, dealer_hand)
        while true
          break if input_check?(h_or_s, player_hand, dealer_hand)
        end
      end
    end

      puts winning_condition

  end
end
