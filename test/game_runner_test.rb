require './test/test_helper'
require './lib/game_runner'

class GameRunnerTest < Minitest::Test
  def test_game_runner_outputs_welcome
    gr = GameRunner.new
    gr.welcome
  end
end
