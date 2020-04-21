def test_character_set
  expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
              "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

  assert_equal expected, @enigma.character_set
end

def test_can_generate_random_number
  num = @enigma.generate_random_num

  assert_equal true, num.to_i < 100000
  assert_equal 5, @enigma.generate_random_num.length
end

def test_date
  Date.expects(:today).returns(Date.new(2020, 04, 18))

  assert_equal "041820", @enigma.date_today
end

def test_can_encrypt_message

  @enigma.expects(:generate_random_num).returns("15794")
  @enigma.expects(:date_today).returns("041820")

  expected = {encryption: "yljyeguahsb!",
              key: "15794",
              date: "041820"}

  assert_equal expected, @enigma.encrypt('HELLO WORLD!')
end
