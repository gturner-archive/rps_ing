module Display

  def intro
    puts "Welcome to Rock, Paper, Scissors"
  end

  def choice_message
    puts "Please make your choice"
  end

  def win_message(comp_pick)
    puts "You win!"
    puts "the computer chose #{comp_pick}"
  end

  def lose_message(comp_pick)
    puts "Sorry, you lose."
    puts "the computer chose #{comp_pick}"
  end

  def tie_message(comp_pick)
    puts "It's a draw"
    puts "the computer chose #{comp_pick}"
  end

  def quitting_msg
    puts "Want to quit?"
  end

end
