require './test/test_helper'
require './lib/board'
require './lib/neighbors'

class NeighborTest < Minitest::Test

  def test_knows_if_space_has_northern_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    refute b1.has_north_neighbor?("A1")
    refute b2.has_north_neighbor?("A1")
    refute b3.has_north_neighbor?("A1")
    assert b1.has_north_neighbor?("B1")
    assert b2.has_north_neighbor?("B1")
    assert b3.has_north_neighbor?("B1")
    assert b1.has_north_neighbor?("D4")
    assert b2.has_north_neighbor?("H8")
    assert b3.has_north_neighbor?("L12")
  end

  def test_knows_if_space_has_southern_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert b1.has_south_neighbor?("A1")
    assert b2.has_south_neighbor?("A1")
    assert b3.has_south_neighbor?("A1")
    assert b1.has_south_neighbor?("B1")
    assert b2.has_south_neighbor?("B1")
    assert b3.has_south_neighbor?("B1")
    refute b1.has_south_neighbor?("D4")
    refute b2.has_south_neighbor?("H8")
    refute b3.has_south_neighbor?("L12")
  end

  def test_knows_if_space_has_eastern_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert b1.has_east_neighbor?("A1")
    assert b2.has_east_neighbor?("A1")
    assert b3.has_east_neighbor?("A1")
    assert b1.has_east_neighbor?("B1")
    assert b2.has_east_neighbor?("B1")
    assert b3.has_east_neighbor?("B1")
    refute b1.has_east_neighbor?("D4")
    refute b2.has_east_neighbor?("H8")
    refute b3.has_east_neighbor?("L12")
  end

  def test_knows_if_space_has_western_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    refute b1.has_west_neighbor?("A1")
    refute b2.has_west_neighbor?("A1")
    refute b3.has_west_neighbor?("A1")
    refute b1.has_west_neighbor?("B1")
    refute b2.has_west_neighbor?("B1")
    refute b3.has_west_neighbor?("B1")
    assert b1.has_west_neighbor?("D4")
    assert b2.has_west_neighbor?("H8")
    assert b3.has_west_neighbor?("L12")
  end

  def test_board_gets_northern_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert_equal "A1", b1.get_north_neighbor("B1")
    assert_equal "A1", b2.get_north_neighbor("B1")
    assert_equal "A1", b3.get_north_neighbor("B1")
    assert_equal "C4", b1.get_north_neighbor("D4")
    assert_equal "G8", b2.get_north_neighbor("H8")
    assert_equal "K12", b3.get_north_neighbor("L12")
  end

  def test_board_gets_southern_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert_equal "B1", b1.get_south_neighbor("A1")
    assert_equal "B1", b2.get_south_neighbor("A1")
    assert_equal "B1", b3.get_south_neighbor("A1")
    assert_equal "C1", b1.get_south_neighbor("B1")
    assert_equal "C1", b2.get_south_neighbor("B1")
    assert_equal "C1", b3.get_south_neighbor("B1")
    assert_equal "D4", b1.get_south_neighbor("C4")
    assert_equal "H8", b2.get_south_neighbor("G8")
    assert_equal "L12", b3.get_south_neighbor("K12")
  end

  def test_board_gets_eastern_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert_equal "A2", b1.get_east_neighbor("A1")
    assert_equal "A2", b2.get_east_neighbor("A1")
    assert_equal "A2", b3.get_east_neighbor("A1")
    assert_equal "B2", b1.get_east_neighbor("B1")
    assert_equal "B2", b2.get_east_neighbor("B1")
    assert_equal "B2", b3.get_east_neighbor("B1")
    assert_equal "D4", b1.get_east_neighbor("D3")
    assert_equal "H8", b2.get_east_neighbor("H7")
    assert_equal "L12", b3.get_east_neighbor("L11")
  end

  def test_board_gets_western_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert_equal "A1", b1.get_west_neighbor("A2")
    assert_equal "A1", b2.get_west_neighbor("A2")
    assert_equal "A1", b3.get_west_neighbor("A2")
    assert_equal "B2", b1.get_west_neighbor("B3")
    assert_equal "B3", b2.get_west_neighbor("B4")
    assert_equal "B4", b3.get_west_neighbor("B5")
    assert_equal "D3", b1.get_west_neighbor("D4")
    assert_equal "H7", b2.get_west_neighbor("H8")
    assert_equal "L11", b3.get_west_neighbor("L12")
  end

  def test_board_gets_neighbors
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert_equal ["B2", "C3", "D2", "C1"], b1.neighbors("C2")
    assert_equal ["A2", "B1"], b1.neighbors("A1")
    assert_equal ["C3", "D4", "D2"], b1.neighbors("D3")
    assert_equal ["E5", "F6", "G5", "F4"], b2.neighbors("F5")
    assert_equal ["G4", "H5", "H3"], b2.neighbors("H4")
    assert_equal ["G8", "H7"], b2.neighbors("H8")
    assert_equal ["A8", "B7", "A6"], b3.neighbors("A7")
    assert_equal ["I11", "J12", "K11", "J10"], b3.neighbors("J11")
    assert_equal ["K12", "L11"], b3.neighbors("L12")
  end

  def test_it_knows_if_two_coordinates_are_neighbors
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert b1.neighbors?("C2", "C1")
    assert b1.neighbors?("A1", "B1")
    refute b1.neighbors?("A1", "A7")
    assert b2.neighbors?("D3", "E3")
    refute b2.neighbors?("F5", "F3")
    refute b2.neighbors?("F5", "A5")
    assert b3.neighbors?("L12", "K12")
    refute b3.neighbors?("K1", "A1")
  end
  
end
