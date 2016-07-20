module Messages

  def self.welcome
    "Welcome to BATTLESHIP"
  end

  def self.prompt_to_play
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.how_to_play
    "Prepare For Battle\n\nThe computer will place ships and then you will be prompted to place ships. Select the start and end coordinates you wish the ship to occupy.\nRules for placing ships:\nPlace each ship in any horizontal or vertical position, but not diagonally.\nDo not place a ship that any part of it overlaps letters, numbers, the edge of the grid, or another ship.\nHow to Play\n\nOn your turn pick a target space to attack and enter its location by letter and number.\nIf you pick a space occupied by a ship on your opponent's ocean grid, your shot is a hit!\n\nIt's a Miss!\nIf you pick a space that is not occupied by a ship on your opponent's ocean grid, it is a miss.\nAfter a hit or miss, your turn is over.\nPlay continues in this manner, with you and your opponent picking spaces one shot per turn.\n\nSinking a Ship\nOnce all the spaces any one ship occupies have been attacked, it has been sunk.\n\nWinning the Game\nIf you are the first player to sink all of your opponents ships, you win the game!"
  end

  def self.ship_placement_message
    "I have laid out my ships on the grid\nYou now need to layout your ships\n"
  end

  def self.prompt_select_difficulty
    "Select a difficulty level:\n(B)eginner = 4x4 grid, 2-unit boat, 3-unit boat\n(I)ntermediate = 8x8 grid, 2-unit boat, 3-unit boat, 4-unit boat\n(A)dvanced = 12x12 grid, 2-unit boat, 3-unit boat, 4-unit boat, 5-unit boat"
  end

  def self.beginner_units
    "The first is two units long and the\nsecond is three units long."
  end

  def self.intermediate_units
    "The first is two units long and the\nsecond is three units long\nthird is four units long."
  end

  def self.advanced_units
    "The first is two units long and the\nsecond is three units long\nthird is four units long\nfourth is 5 units long and shall be named 'Battle Star Galactica'."
  end

  def self.beginner_grid_description
    "The grid has A1 at the top left and D4 at the bottom right."
  end

  def self.intermediate_grid_description
    "The grid has A1 at the top left and H8 at the bottom right."
  end

  def self.advanced_grid_description
    "The grid has A1 at the top left and L12 at the bottom right."
  end

  def self.prompt_place_ship(ship_type)
    ships = { 2 => "two", 3 => "three", 4 => "four", 5 => "Battle Star Galactica - five"}
    "\nEnter the squares for the #{ships[ship_type]}-unit ship:"
  end

  def self.prompt_player_for_firing_coordinates
    "Enter firing coordinates:"
  end

  def self.error_invalid_coordinate
    "Those coordinates are not on the grid. Coordinates are defined by row letter and a column number. For example 'A1'."
  end

  def self.error_previously_attacked_coordinate
    "You attacked those coordinates on a previous turn. Select new, unattacked coordinates for maximum destruction."
  end

  def self.message_hit
    success = ["Great success!", "Well done!", "Simply stunning!", "You truly are a master of the seas!", "Your will be done.", "Now you have them where you want them.", "Lets see how they like the taste of steal.", "The enemy shudders at your tenacity.", "The sharks are circling.", "You have a rare talent.", "An efficacious decision.", "You chose wisely."]
    "#{success.sample} You have hit an enemy ship."
  end

  def self.message_miss
    failure = ["A terrible mistake!", "You chose poorly.", "Check your instruments.", "I miss the old captain.", "That could have been better.", "There is always next turn.", "Even monkeys fall off trees.", "Maybe next time will be better.", "You know what your are doing, right?", "No matter what the other crew members say, I still think you are the best.", "You chose poorly.", "A terrible mistake.", "Wish we could re-do that one.", "Does this game have mulligans?"]
    "#{failure.sample} You did not hit an enemy ship."
  end

  def self.message_computer_hit(coordinate)
    "Incoming fire at #{coordinate}.... Your opponent has scored a direct hit."
  end

  def self.message_computer_miss(coordinate)
    praise = ["What cunning ship placement.", "The enemy is blind to our location.", "Fooled them!", "Your ship placement skills are truly remarkable.", "You have a rare gift for ship placement.", "You are the Lebron James of ship placement.", "Are you sure this is your first time playing?", "Everyone thinks you are the best!", "Your ship placement is a reflection of your genius.", "Ha, more empty ocean for our foes.", "Hey opponent, your mom called. She said 'You suck.'", "Missed us by a mile.", "That was close.", "That was a close one", "A little too close for my liking.", "What a relief.", "Good news!", "Good news!", "Wonderful news!", "Fantastic nes!", "Stupendous tidings!"]
    "#{praise.sample} Your opponent has fired on space #{coordinate} and missed!"
  end

  def self.prompt_player_to_end_turn
    "Press ENTER to end your turn."
  end

  def self.computer_map_message
    "Here is your opponent's progress:"
  end

  def self.player_map_message
    "Here is your progress:"
  end

  def self.hit_no_sink_message
    "The hit did not sink the ship."
  end

  def self.hit_sink_message(ship_type)
    ships = { 2 => "two", 3 => "three", 4 => "four", 5 => "Battle Star Pegasus - five"}
    "The hit sunk the #{ships[ship_type]}-unit ship."
  end

  def self.congratulations
    "Congratulations. You are victorious!"
  end

  def self.condolences
    "All Your Battleships Are Belong To Us!"
  end

  def self.shots_fired_message(shots_fired)
    "Ammunition stores depleated by #{shots_fired} shells."
  end

  def self.game_clock_message(time_string)
    "Total game time: #{time_string}"
  end

end
