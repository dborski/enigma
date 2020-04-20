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
    truncated_shift = shift_values.slice(:A, :B, :C, :D)
    all_characters = ("a".."z").to_a << " "

    encrypted_message = message.downcase.chars.map.with_index do |letter, index|
      if all_characters.any? { |character| character == letter}
        shift = all_characters.find_index(letter) + truncated_shift.values[index % truncated_shift.length]
        all_characters[shift % all_characters.length]
      else
        letter
      end
    end.join

    {encryption: encrypted_message,
     key:        key[:key],
     date:       date[:date]
    }
  end
end
