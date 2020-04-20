require_relative 'enigma'

text = File.open(ARGV[0], "r")
message = text.read
chopped_message = message.chomp
text.close

require "pry"; binding.pry
