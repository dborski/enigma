require './lib/shift'

class Enigma

  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def shift_values
    Shift.new.create_shift
  end

  def key
    shift_values.slice(:key)
  end

  def date
    shift_values.slice(:date)
  end

  def encrypt(message)

  end
end
