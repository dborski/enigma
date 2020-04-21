require_relative 'shift'
require_relative 'cipher_algo'
require 'date'

class Enigma < CipherAlgo

  def encrypt(message, key = generate_random_num, date = date_today)
    encrypted_message = encrypt_message(message, key, date)

    {encryption: encrypted_message,
     key:        key,
     date:       date}
  end

  def decrypt(message, key, date = date_today)
    decrypted_message = decrypt_message(message, key, date)

    {decryption: decrypted_message,
     key:        key,
     date:       date}
  end
end
