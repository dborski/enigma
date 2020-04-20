require './test/test_helper'
require './lib/enigma'
require './lib/shift'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
                "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, @enigma.character_set
  end

  def test_shift_values
    assert_instance_of Hash, @enigma.shift_values
    assert_equal 6, @enigma.shift_values.length
  end

  def test_key
    stub_value = {A: 17,
                B: 61,
                C: 79,
                D: 94,
                key: "15794",
                date: "041820"}
    @enigma.expects(:shift_values).returns(stub_value)

    assert_equal ({key: "15794"}), @enigma.key
  end

  def test_date
    stub_value = {A: 17,
                B: 61,
                C: 79,
                D: 94,
                key: "15794",
                date: "041820"}
    @enigma.expects(:shift_values).returns(stub_value)

    assert_equal ({date: "041820"}), @enigma.date
  end

  def test_can_encrypt_message
    stub_value = {A: 17,
                B: 61,
                C: 79,
                D: 94,
                key: "15794",
                date: "041820"}
    @enigma.expects(:shift_values).returns(stub_value)
    @enigma.expects(:key).returns({key: "15794"})
    @enigma.expects(:date).returns({date: "041820"})

    expected = {encryption: "yljyeguahsb!",
                key: "15794",
                date: "041820"}

    assert_equal expected, @enigma.encrypt('HELLO WORLD!')
  end
end
