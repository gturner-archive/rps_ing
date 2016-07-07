module RpsIng

  class Game
    include Display

    def initialize
      @player = Human.new
      @pick_arr = %w[r p s]
      @computer = Computer.new
    end

    def play
      intro
      loop do
        @player.get_input
        victory?
        break if quitting?
      end
    end

    def victory?
      comp_pick = @computer.get_input
      # player_pick = @player.get_input
      win?(comp_pick) || lose?(comp_pick) || tie?(comp_pick)
    end

    def index_finder(player)
      @pick_arr.find_index(player.player_input)
    end

    def win?(comp_pick)
      if comp_pick == @pick_arr[(index_finder(@player) - 1)]
        win_message(comp_pick)
        return true
      end
      false
    end

    def lose?(comp_pick)
      if comp_pick == @pick_arr[(index_finder(@player) + 1) % 3]
        lose_message(comp_pick)
        return true
      end
      false
    end

    def tie?(comp_pick)
      tie_message(comp_pick)
      true
    end

    def quitting?
      quitting_msg
      input = gets.strip.downcase
      input == 'quit' || input ==  'q'
    end
  end
end
