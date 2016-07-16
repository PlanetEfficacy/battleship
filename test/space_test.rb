require './test/test_helper'
require './lib/space'

class SpaceTest < Minitest::Test
  def test_space_has_coordinates
    s = Space.new("A1")
    assert_equal "A1", s.coordinates
  end

  def test_space_occupied_starts_false
    s = Space.new("A1")
    refute s.occupied
  end

  def test_space_attacked_starts_false
    s = Space.new("A1")
    refute s.attacked
  end
end
