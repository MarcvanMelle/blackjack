def dealer_bust?(dealer, player)
  if dealer.calculate_hand > 21 && player.calculate_hand <= 21
    puts "Dealer BUST!"
    return true
  end
end

def player_bust?(dealer, player)
  if player.calculate_hand > 21 && dealer.calculate_hand <= 21
    puts "Player BUST!"
    return true
  end
end

def tie?(dealer, player)
  if player.calculate_hand == 21 && dealer.calculate_hand == 21
    puts "TIE!"
    return true
  end
end

def input(player, dealer)
  puts "\nDealer at: #{dealer.calculate_hand}".colorize(:red)
  puts "Player at: #{player.calculate_hand}".colorize(:light_blue)
  puts "Would you like to Hit or Stand? (H/S)"
  return gets.chomp
end

def input_check?(h_or_s, player, deck)
  if h_or_s == 'h'
    puts player_hit
    return true
  elsif h_or_s == 's'
    puts player_stays
    return true
  else
    puts "Input not recognized, try again."
    return false
  end
end
