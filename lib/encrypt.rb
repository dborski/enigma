require_relative 'enigma'

text = File.open(ARGV[0], "r")
message = text.read
chopped_message = message.chomp
text.close

encrypted_message = Enigma.new.encrypt(chopped_message)
message_to_write = encrypted_message[:encryption]
writer = File.open(ARGV[1], "w")
writer.write(message_to_write)
writer.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
