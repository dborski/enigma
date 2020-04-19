require './lib/shift'

class Enigma

  attr_reader :character_set, :shift_values
  def initialize
    @character_set = ("a".."z").to_a << " "
    @shift_values = Shift.new.create_shift
  end

  def split_message(message)
    message.chars.each_slice(4).to_a.map do |segment|
      segment.map { |character| character.downcase}
    end
  end

  def encrypt(message)
  end
end
