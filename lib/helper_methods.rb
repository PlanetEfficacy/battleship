module HelperMethods

  def self.valid_user_selection?(user_input_to_play, acceptable_inputs)
    acceptable_inputs.include?(user_input_to_play.downcase[0])
  end

  def self.get_user_input
    input = gets.chomp
    input.downcase[0]
  end

  def self.get_user_coordinates
    input = gets.chomp
    input.upcase.split(" ")
  end

  def self.get_user_coordinate
    input = gets.chomp
    input.upcase
  end

end
