require './test/test_helper'
require './lib/attack_assessment'

class RulesTest < Minitest::Test
  include AttackAssessment

  def test_it_knows_if_a_ship_has_been_hit
    b1 = Board.new(4)
    p1 = Player.new([2,3])
    s1 = p1.get_ship(2)
    p1.place_ship(b1, s1, "A1", "B1")

    assert AttackAssessment.hit?(b1, "A1")
  end

  def test_get_ship_by_coordinate
    b1 = Board.new(4)
    p1 = Player.new([2,3])
    s1 = p1.get_ship(2)
    s2 = p1.get_ship(3)
    p1.place_ship(b1, s1, "A1", "B1")
    p1.place_ship(b1, s2, "D1", "D3")

    assert_equal s1, AttackAssessment.get_ship_by_coordinate(b1, p1, "A1")
    assert_equal s1, AttackAssessment.get_ship_by_coordinate(b1, p1, "B1")
    assert_equal s2, AttackAssessment.get_ship_by_coordinate(b1, p1, "D1")
    assert_equal s2, AttackAssessment.get_ship_by_coordinate(b1, p1, "D2")
    assert_equal s2, AttackAssessment.get_ship_by_coordinate(b1, p1, "D3")
  end

end
