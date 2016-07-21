require './lib/game'

module AttackAssessment
  def self.hit?(board, coordinate)
    board.space_occupied?(coordinate)
  end

  def self.get_ship_by_coordinate(board, player, coordinate)
    fleet = player.fleet
    fleet.find do |ship|
      start_space = ship.start_space
      end_space = ship.end_space
      ship_spaces = board.get_spaces_between(start_space, end_space)
      ship_spaces.include?(coordinate)
    end
  end
  
end
