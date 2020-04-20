require_relative 'enigma'

text = File.open(ARGV[0], "r")
message = text.read
chopped_message = message.chomp
text.close

encrypted_message = Enigma.new.encrypt(chopped_message)

require "pry"; binding.pry
# writer = File.open(ARGV[1], "w")
# writer.close
