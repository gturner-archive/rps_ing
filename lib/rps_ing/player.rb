class Player
  include Display

  def valid_input?(input)
    %[r p s].include?(input)
  end

end
