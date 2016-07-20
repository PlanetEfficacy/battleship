require './lib/game'

module AttackAssessment
  def hit?(board, coordinate)
    board.space_occupied?(coordinate)
  end

  def get_ship_by_coordinate(board, player, coordinate)
    fleet = player.fleet
    fleet.find do |ship|
      start_space = ship.start_space
      end_space = ship.end_space
      ship_spaces = board.get_spaces_between(start_space, end_space)
      ship_spaces.include?(coordinate)
    end
  end

  def attack_sequence
  # Prompt player for coordinate to attack / get unattacked coordinate
  # Player Attacks a coordinate on the opposing players board
  # AttackAssessment hit?(opposing player's board, selected coordinate)
    # True
      # put ship hit message
      # Get ship by coordinate
      # Ship.hit
      # Ship.is_sunk?
        # True
          # put ship sunk message
    # False
      # put ship miss message

    end

end
