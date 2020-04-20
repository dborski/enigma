require_relative 'enigma'

text = File.open(ARGV[0], "r")
message = text.read
chopped_message = message.chomp
text.close

key = ARGV[2]

decrypted_message = Enigma.new.decrypt(chopped_message, key)
message_to_write = decrypted_message[:decryption]
writer = File.open(ARGV[1], "w")
writer.write(message_to_write)
writer.close

puts "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
