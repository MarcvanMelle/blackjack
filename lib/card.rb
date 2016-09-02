class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def check_rank(*args)
    args.each do |arg|
      if rank == arg
        return true
      end
    end
    return false
  end

  def display
    "#{rank}#{suit} "
  end

  def check_rank(*args)
    args.each do |arg|
      if arg == rank
        return true
      end
    end
    return false
  end

  def display
    "#{rank}#{suit} "
  end
end
