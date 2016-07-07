module RpsIng
  class Human < Player
    attr_reader :player_input

    def initialize
      @player_input = ""
    end

    def get_input
      loop do
        choice_message
        @player_input = gets.strip.downcase
        break if valid_input?(@player_input)
      end
    end
  end
end
