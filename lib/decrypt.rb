require_relative 'enigma'
require 'date'

@enigma = Enigma.new

text = File.open(ARGV[0], "r")
message = text.read
chopped_message = message.chomp
text.close

key = ARGV[2]

decrypted_message = @enigma.decrypt(chopped_message, key)
message_to_write = decrypted_message[:decryption]
writer = File.open(ARGV[1], "w")
writer.write(message_to_write)
writer.close

date = decrypted_message[:date]
new_date = date.gsub(/(.{2})(?=.)/, '\1-\2')
date_obj = Date.strptime(new_date,'%m-%d-%y')
written_date = date_obj.strftime("%d%m%y")

puts "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and date #{written_date}"
