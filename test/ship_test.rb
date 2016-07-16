require './test/test_helper'
require './lib/ship'

class ShipTest < Minitest::Test
  def test_ship_has_length
    destroyer1 = Ship.new(2)
    destroyer2 = Ship.new(3)
    destroyer3 = Ship.new(4)
    destroyer4 = Ship.new(5)

    assert_equal 2, destroyer1.length
    assert_equal 3, destroyer2.length
    assert_equal 4, destroyer3.length
    assert_equal 5, destroyer4.length
  end

  def test_ship_starts_undamaged
    destroyer1 = Ship.new(2)
    destroyer2 = Ship.new(5)

    assert_equal 0, destroyer1.damage
    assert_equal 0, destroyer2.damage
  end

  def test_ship_can_be_assigned_position
    destroyer1 = Ship.new(2)
    destroyer2 = Ship.new(3)
    destroyer1.place("A1", "A2")
    destroyer2.place("B1", "B3")
    expected1_start = "A1"
    expected2_start = "B1"
    expected1_end = "A2"
    expected2_end = "B3"

    assert_equal expected1_start, destroyer1.start_space
    assert_equal expected2_start, destroyer2.start_space
    assert_equal expected1_end, destroyer1.end_space
    assert_equal expected2_end, destroyer2.end_space
  end

  def test_ship_has_damage
    destroyer1 = Ship.new(2)

    assert_equal 0, destroyer1.damage
  end

  def test_ship_hit_causes_damage
    destroyer1 = Ship.new(2)
    initial_damage = destroyer1.damage
    2.times { destroyer1.hit }
    end_damage = destroyer1.damage

    assert_equal 0, initial_damage
    assert_equal 2, end_damage
  end

  def test_ship_can_float
    destroyer2 = Ship.new(2)
    destroyer3 = Ship.new(3)
    destroyer4 = Ship.new(4)
    destroyer5 = Ship.new(5)

    refute destroyer2.is_sunk?
    refute destroyer3.is_sunk?
    refute destroyer4.is_sunk?
    refute destroyer5.is_sunk?
  end

  def test_ship_sinks_when_damage_equals_length
    destroyer2 = Ship.new(2)
    initial = destroyer2.is_sunk?
    destroyer2.hit
    one_hit = destroyer2.is_sunk?
    destroyer2.hit
    two_hits = destroyer2.is_sunk?

    refute initial
    refute one_hit
    assert two_hits
  end

end
