module RpsIng

  class Player
    include Display

    def valid_input?(input)
      %w[r p s].include?(input)
    end

  end
end
