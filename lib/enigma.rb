require './lib/shift'

class Enigma

  attr_reader :character_set, :shift_values
  def initialize
    @character_set = ("a".."z").to_a << " "
    @shift_values = Shift.new.create_shift
  end
end
