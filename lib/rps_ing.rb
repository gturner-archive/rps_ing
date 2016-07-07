require "rps_ing/version"

module RpsIng
  class Game
    def initialize
      @player = Player.new
    end

    def play
      intro
      loop do
        player_input
        break if game_over?
      end
      results
    end

    def game_over
    end

    def player_input
    end

  end

  class Player

    def validate_input
    end

    def compare_input
    end

    def ask_input
    end

  end

  class Human < Player
  end

  class Computer < Player
  end

  module Display

    def intro
      puts "Welcome to Rock, Paper, Scissors"
      puts "Please make your choice"
    end

    def results
    end

  end

end
