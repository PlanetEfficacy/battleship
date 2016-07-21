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
      play_quit_instructions(user_input_to_play)
      user_input_to_play = HelperMethods.get_user_input
    end
  end

  def self.select_difficulty
    puts Messages.prompt_select_difficulty
    user_difficulty_input = ""
    until HelperMethods.valid_user_selection?(user_difficulty_input, ["b","i","a","t"])
      user_difficulty_input = HelperMethods.get_user_input
    end
    game = Game.new(GameSettings.new(user_difficulty_input))
  end

  def self.play_quit_instructions(user_input_to_play)
    puts Messages.prompt_to_play if did_not_pick_play?(user_input_to_play)
    puts Messages.how_to_play if needs_instrucions?(user_input_to_play)
    exit if wants_to_quit?(user_input_to_play)
  end

  def self.did_not_pick_play?(user_input_to_play)
    !HelperMethods.valid_user_selection?(user_input_to_play, ["p", "q", "i"])
  end

  def self.needs_instrucions?(user_input_to_play)
    user_input_to_play == "i"
  end

  def self.wants_to_quit?(user_input_to_play)
    user_input_to_play == "q"
  end

  welcome
  select_difficulty
end
