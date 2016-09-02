class Deck

  RANK = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "K", "Q", "A"]
  SUITS = ["♦︎", "♠︎", "♣︎", "♥︎"]

  attr_accessor :cards

  def initialize
    @cards = build_deck
  end

  def build_deck
    card = []
    RANK.each do |rank|
      SUITS.each do |suit|
        card << Card.new(rank, suit)
      end
    end
    return card.shuffle!
  end

  def deal(num)
    cards.pop(num)
  end

end
