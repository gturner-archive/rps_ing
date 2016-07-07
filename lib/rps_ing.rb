require "rps_ing/version"

module RpsIng
  include Display
  class Game
    def initialize
      @player = Player.new
      @pick_arr = %w[r p s]
    end

    def play
      intro
      loop do
        @player.ask_input
        break if victory?
      end
      results
    end

    def victory?
      comp_pick = Computer.new.get_input
      win?(comp_pick) || lose?(comp_pick) || tie?(comp_pick)

      @player.player_input.find_index(@pick_arr)

    end

    def index_finder(player)
      @pick_arr.find_index(player.get_input)
    end

    def win?
      find_index
    end

    def lose?

    end

    def tie?

    end
  end

  class Player

    def validate_input
    end

    def compare_input
    end

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

    def results
    end

  end

end
