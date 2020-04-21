require_relative 'shift'
require_relative 'encryption_algo'
require 'date'

class Enigma < EncryptionAlgo

  def encrypt(message, key = generate_random_num, date = date_today)
    encrypted_message = encrypt_message(message, key, date)

    {encryption: encrypted_message,
     key:        key,
     date:       date
    }
  end

  def decrypt(message, key, date = date_today)
    shift_values = Shift.create_shift(key, date)
    all_characters = character_set

    decrypted_message = message.downcase.chars.map.with_index do |letter, index|
      if all_characters.any? { |character| character == letter}
        shift = all_characters.find_index(letter) - shift_values.values[index % shift_values.length]
        all_characters[shift % all_characters.length]
      else
        letter
      end
    end.join

    {decryption: decrypted_message,
     key:        key,
     date:       date
    }
  end
end
