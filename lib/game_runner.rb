require './lib/messages'
require './lib/helper_methods'
require './lib/game_settings'
require './lib/game'
require 'pry'

class GameRunner

  def self.welcome
    puts Messages.welcome
    user_input_to_play = ""
    until user_input_to_play == "p"
      puts Messages.prompt_to_play
      user_input_to_play = HelperMethods.get_user_input
      puts Messages.prompt_to_play.upcase if !HelperMethods.valid_user_selection?(user_input_to_play, ["p", "q", "i"])
      puts Messages.how_to_play if user_input_to_play == "i"
      exit if user_input_to_play == "q"
    end
  end

  def self.select_difficulty
    puts Messages.prompt_select_difficulty
    user_difficulty_input = ""
    until HelperMethods.valid_user_selection?(user_difficulty_input, ["b","i","a","t"])
      user_difficulty_input = HelperMethods.get_user_input
    end
    settings = GameSettings.new(user_difficulty_input)
    game = Game.new(settings)
  end

  welcome
  select_difficulty

end






# def initialize()
#   @settings
# end

# welcome

# puts prompt_to_play
# user_input_to_play = gets.chomp

# Choose Difficulty => stores as attribute in game runner.
# difficulty = nil
# until ["B", "I", "A"].include?(difficulty) do
#   # prompt_select_difficulty
#   difficulty = gets.chomp.upcase
# end

# @settings = GameSettings.new(difficulty).difficulty
#
# game = Game.new(@settings)
# GameRunner.new
