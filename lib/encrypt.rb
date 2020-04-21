require_relative 'enigma'
require 'date'

@enigma = Enigma.new

text = File.open(ARGV[0], "r")
message = text.read
chopped_message = message.chomp
text.close

encrypted_message = @enigma.encrypt(chopped_message)
message_to_write = encrypted_message[:encryption]
writer = File.open(ARGV[1], "w")
writer.write(message_to_write)
writer.close

date = encrypted_message[:date]
new_date = date.gsub(/(.{2})(?=.)/, '\1-\2')
date_obj = Date.strptime(new_date,'%m-%d-%y')
written_date = date_obj.strftime("%d%m%y")

puts "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{written_date}"
