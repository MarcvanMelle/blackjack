class Hand

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    hand_value = 0
    @cards.each do |card|
      if card.check_rank("A")
        hand_value += 11
      elsif card.check_rank("J", "Q", "K")
        hand_value += 10
      else
        hand_value += card.rank
      end
    end
    if hand_value > 21
      @cards.each do |card|
        if card.check_rank("A")
          hand_value -= 10
          if hand_value <= 21
            break
          end
        end
      end
    end
    return hand_value
  end

  def hit(deck)
    self.cards << deck.cards.pop
  end

  def display
    output = ''
    cards.each do |card|
      output += card.display
    end
    return output
  end
end
