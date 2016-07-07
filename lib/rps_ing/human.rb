class Human < Player
  attr_reader :player_input

  def initialize
    @player_input = ""
  end

  def get_input
      choice_message
      @player_input = gets.strip.downcase until valid_input?(@player_input)
  end

end
