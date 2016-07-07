require "rps_ing/version"

module RpsIng
  include Display
  class Game
    def initialize
      @player = Player.new
      @pick_arr = %w[r p s]
      @computer = Computer.new
    end

    def play
      intro
      loop do
        @player.ask_input
        victory?
        break if quitting?
      end
    end

    def victory?
      comp_pick = @computer.ask_input
      win?(comp_pick) || lose?(comp_pick) || tie?(comp_pick)
    end

    def index_finder(player)
      @pick_arr.find_index(player.get_input)
    end

    def win?(comp_pick)
      if comp_pick == @pick_arr[(index_finder(@player) - 1)]
        win_message
        return true
      end
      false
    end

    def lose?

      if comp_pick == @pick_arr[(index_finder(@player) + 1)]
        lose_message
        return true
      end
      false
    end

    def tie?
      tie_message
      true
    end

    def quitting
      input = gets.strip.downcase
      input == 'quit' || input ==  'q'
    end

  end

  class Player

    def ask_input
      choice_message
      get_input
    end

    def valid_input?(input)
      %[r p s].include?(input)
    end

  end

  class Human < Player
    attr_reader :player_input

    def get_input
        @player_input = gets.strip until valid_input?(@player_input)
    end

  end

  class Computer < Player

    def get_input
      %w[r p s].sample
    end
  end

  module Display

    def intro
      puts "Welcome to Rock, Paper, Scissors"
    end

    def choice_message
      puts "Please make your choice"
    end

    def win_message
      puts "You win!"
    end

    def lose_message
      puts "Sorry, you lose."
    end

    def tie_message
      puts "It's a draw"
    end

  end

end
