module Messages

  def self.welcome
    "\n\nWelcome to BATTLESHIP"
  end

  def self.prompt_to_play
    "\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.how_to_play
    "\n\nPrepare For Battle\n\nThe computer will place ships and then you will be prompted to place ships.\nSelect the start and end coordinates you wish the ship to occupy.\n\nRules for placing ships:\n\nPlace each ship in any horizontal or vertical position, but not diagonally.\nDo not place a ship that any part of it overlaps letters, numbers, the edge of the grid, or another ship.\n\nHow to Play\n\nOn your turn pick a target space to attack and enter its location by letter and number.\nIf you pick a space occupied by a ship on your opponent's ocean grid, your shot is a hit!\n\nIt's a Miss!\n\nIf you pick a space that is not occupied by a ship on your opponent's ocean grid, it is a miss.\nAfter a hit or miss, your turn is over.\nPlay continues in this manner, with you and your opponent picking spaces one shot per turn.\n\nSinking a Ship\n\nOnce all the spaces any one ship occupies have been attacked, it has been sunk.\n\nWinning the Game\n\nIf you are the first player to sink all of your opponents ships, you win the game!\n\n\n" + prompt_to_play
  end

  def self.ship_placement_message
    "\n\nI have laid out my ships on the grid.\n\nYou now need to layout your ships."
  end

  def self.prompt_select_difficulty
    "\n\nSelect a difficulty level:\n\n(B)eginner = 4x4 grid, 2-unit boat, 3-unit boat\n(I)ntermediate = 8x8 grid, 2-unit boat, 3-unit boat, 4-unit boat\n(A)dvanced = 12x12 grid, 2-unit boat, 3-unit boat, 4-unit boat, 5-unit boat\n\n"
  end

  def self.beginner_units
    "\nThe first is two units long and the\nsecond is three units long."
  end

  def self.intermediate_units
    "\nThe first is two units long, the\nsecond is three units long,\nand the third is four units long."
  end

  def self.advanced_units
    "\nThe first is two units long, the\nsecond is three units long,\nthe third is four units long,\nand the fourth is 5 units long.\nYour fourth ship shall be named 'Battle Star Galactica'."
  end

  def self.beginner_grid_description
    "\nThe grid has A1 at the top left and D4 at the bottom right.\n"
  end

  def self.intermediate_grid_description
    "\nThe grid has A1 at the top left and H8 at the bottom right.\n"
  end

  def self.advanced_grid_description
    "\nThe grid has A1 at the top left and L12 at the bottom right.\n"
  end

  def self.prompt_place_ship(ship_type)
    ships = { 2 => "two", 3 => "three", 4 => "four", 5 => "Battle Star Galactica - five"}
    "\n\nEnter the squares for the #{ships[ship_type]}-unit ship. For example 'A1 A2':"
  end

  def self.error_diagonal_placement
    "\n\nThose coordinates are either not in the same row or column.\nShips must be placed horizontally or vertically.\nThe coordinates input to place a ship must either have the same row (eg. A... A...)\nor the same column (eg. ...1 ...1)."
  end

  def self.error_length
    "\n\nThose coordinates are not the correct distance apart."
  end

  def self.error_overlap
    "\n\nPlacing a ship at those coordinates would overlap another ship."
  end

  def self.prompt_player_for_firing_coordinates
    "\n\nEnter firing coordinates:"
  end

  def self.error_invalid_coordinate
    "\n\nThose coordinates are not on the grid.\nCoordinates are defined by row letter\nand a column number. For example 'A1'."
  end

  def self.error_previously_attacked_coordinate
    "\n\nYou attacked those coordinates on a previous turn.\nSelect new, unattacked coordinates for maximum destruction."
  end

  def self.message_hit
    success = ["Great success!", "Well done!", "Simply stunning!", "You truly are a master of the seas!", "Your will be done.", "Now you have them where you want them.", "Lets see how they like the taste of steal.", "The enemy shudders at your tenacity.", "The sharks are circling.", "You have a rare talent.", "An efficacious decision.", "You chose wisely."]
    "\n\n#{success.sample} You have hit an enemy ship."
  end

  def self.message_miss
    failure = ["A terrible mistake!", "You chose poorly.", "Check your instruments.", "I miss the old captain.", "That could have been better.", "There is always next turn.", "Even monkeys fall off trees.", "Maybe next time will be better.", "You know what your are doing, right?", "No matter what the other crew members say, I still think you are the best.", "You chose poorly.", "A terrible mistake.", "Wish we could re-do that one.", "Does this game have mulligans?"]
    "\n\n#{failure.sample} You did not hit an enemy ship."
  end

  def self.message_computer_hit(coordinate)
    "\n\nIncoming fire at #{coordinate}.... Your opponent has scored a direct hit."
  end

  def self.message_computer_miss(coordinate)
    praise = ["What cunning ship placement.", "The enemy is blind to our location.", "Fooled them!", "Your ship placement skills are truly remarkable.", "You have a rare gift for ship placement.", "You are the Lebron James of ship placement.", "Are you sure this is your first time playing?", "Everyone thinks you are the best!", "Your ship placement is a reflection of your genius.", "Ha, more empty ocean for our foes.", "Hey opponent, your mom called. She said 'You suck.'", "Missed us by a mile.", "That was close.", "That was a close one", "A little too close for my liking.", "What a relief.", "Good news!", "Good news!", "Wonderful news!", "Fantastic nes!", "Stupendous tidings!"]
    "\n\n#{praise.sample} Your opponent has fired on space #{coordinate} and missed!"
  end

  def self.prompt_player_to_end_turn
    "\n\nPress ENTER to end your turn."
  end

  def self.computer_map_message
    "\n\nHere is your opponent's progress:"
  end

  def self.player_map_message
    "\n\nHere is your progress:"
  end

  def self.hit_no_sink_message
    "\n\nThe hit did not sink the ship."
  end

  def self.hit_sink_message(ship_type)
    ships = { 2 => "two", 3 => "three", 4 => "four", 5 => "Battle Star Pegasus - five"}
    "\n\nThe hit sunk the #{ships[ship_type]}-unit ship."
  end

  def self.congratulations
    "\n\nCongratulations. You are victorious!"
  end

  def self.condolences
    "\n\nAll Your Battleships Are Belong To Us!\n\n"
  end

  def self.shots_fired_message(shots_fired)
    "\n\nAmmunition stores depleated by #{shots_fired} shells."
  end

  def self.game_clock_message(time_string)
    "\n\nTotal game time: #{time_string}\n\nThank you for playing battleship.\n\nGame Over.\n\n\n\n\n\n"
  end

end
