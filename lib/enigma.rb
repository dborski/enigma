require './lib/shift'

class Enigma

  def generate_random_num
    rand(5 ** 5).to_s.rjust(5, "0")
  end

  def date_today
    Date.today.strftime("%m%d%y")
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def encrypt(message, key = generate_random_num, date = date_today)
    shift_values = Shift.create_shift(key, date)
    all_characters = character_set

    encrypted_message = message.downcase.chars.map.with_index do |letter, index|
      if all_characters.any? { |character| character == letter}
        shift = all_characters.find_index(letter) + shift_values.values[index % shift_values.length]
        all_characters[shift % all_characters.length]
      else
        letter
      end
    end.join

    {encryption: encrypted_message,
     key:        key,
     date:       date
    }
  end
end
