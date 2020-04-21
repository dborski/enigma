require_relative 'shift'
require 'date'

class CipherAlgo

  def generate_random_num
    rand(5 ** 5).to_s.rjust(5, "0")
  end

  def date_today
    Date.today.strftime("%m%d%y")
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def encrypt_message(message, key = generate_random_num, date = date_today)
    shift_values = Shift.create_shift(key, date)
    all_characters = character_set

    message.downcase.chars.map.with_index do |letter, index|
      if all_characters.any? { |character| character == letter}
        shift = all_characters.find_index(letter) + shift_values.values[index % shift_values.length]
        all_characters[shift % all_characters.length]
      else
        letter
      end
    end.join
  end

  def decrypt_message(message, key, date = date_today)
    shift_values = Shift.create_shift(key, date)
    all_characters = character_set

    message.downcase.chars.map.with_index do |letter, index|
      if all_characters.any? { |character| character == letter}
        shift = all_characters.find_index(letter) - shift_values.values[index % shift_values.length]
        all_characters[shift % all_characters.length]
      else
        letter
      end
    end.join
  end
end
