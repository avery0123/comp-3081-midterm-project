require_relative 'lib/game'


def prompt(message)
  print "#{message}: "
  gets.chomp
end

def display_game_state(game)
  game.players.each do |player|
    puts "#{player.name}'s hand: #{player.hand.cards.map { |card| "#{card.rank} of #{card.suit}" }.join(', ')}"
    puts "#{player.name}'s pot: #{player.pot} chips"
  end
end

puts "Welcome to Five Card Draw Poker!"


player_names = []
2.times do |i|
  player_name = prompt("Enter name for Player #{i + 1}")
  player_names << player_name
end


game = Game.new(*player_names)


loop do
  puts "\nNew round begins!\n\n"


  game.deal_cards


  display_game_state(game)

  puts "\nBetting phase:"
  game.players.each do |player|
    begin
      puts "\n#{player.name}'s turn:"
      puts "Minimum bet: 10 chips"
      puts "Available chips: #{player.pot}"
      bet = prompt("Place your bet (enter 'fold' to fold): ").downcase
      if bet == 'fold'
        puts "#{player.name} folds!"
        next
      end
      bet_amount = bet.to_i
      raise "Invalid bet amount" if bet_amount < 10 || bet_amount > player.pot
      game.bet(bet_amount)
      player.pot -= bet_amount
    rescue StandardError => e
      puts "Error: #{e.message}. Try again."
      retry
    end
  end

  puts "\nDiscarding phase:"
  game.players.each do |player|
    next if player.folded?
    begin
      puts "\n#{player.name}'s turn:"
      puts "Your hand: #{player.hand.cards.map.with_index { |card, index| "#{index + 1}: #{card.rank} of #{card.suit}" }.join(', ')}"
      discards = prompt("Enter indices of cards to discard (e.g., '1 3 4'), or 'none' to keep all cards: ").split.map(&:to_i)
      next if discards.include?('none')
      raise "Invalid input" unless discards.all? { |index| index >= 1 && index <= 5 }
      game.discard(discards)
    rescue StandardError => e
      puts "Error: #{e.message}. Try again."
      retry
    end
  end

  winner = game.winner
  puts "\nRound winner: #{winner.name}"
  winner.pot += game.pot
  puts "#{winner.name} wins the pot of #{game.pot} chips!"

  puts "\nOverall game score:"
  game.players.each do |player|
    puts "#{player.name}: #{player.pot} chips"
  end

  continue = prompt("\nDo you want to play another round? (yes/no)").casecmp("yes") == 0
  break unless continue
end

puts "Thank you for playing Five Card Draw Poker!"
